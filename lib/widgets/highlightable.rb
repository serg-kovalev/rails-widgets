module Widgets
  module Highlightable
    def self.included(base)
    
      # base.extend(ClassMethods)
      base.class_eval do
        include InstanceMethods
        attr_writer :highlights
      end
    end

    module InstanceMethods 
      def highlights
        @highlights ||= []
        @highlights
      end
      
      # a rule can be:
      #  * a parameter hash eg: {:controller => 'main', :action => 'welcome'}
      #  * a string containing an URL eg: 'http://blog.seesaw.it'
      def highlights_on rule
        highlights << rule
      end
      
      # force the tab as highlighted
      def highlight!
        highlights_on proc { true }
      end
     
      # takes in input a Hash (usually params)
      # or a string/Proc that evaluates to true/false
      # it does ignore some params like 'only_path' etc..
      # we have to do this in orderr to support restful routes
      def highlighted? options={}
        # puts "### '#{name}'.highlighted? #{options.inspect}"
        result = false
        # p "### #{highlights.inspect}"
        highlights.each do |highlight| # for every highlight(proc or hash)
          
          highlighted = true
          if highlight.kind_of? String # do not highlight @TODO: should we evaluate the request URI for this?
     
            highlighted &= options[:id]==highlight.match(/\d*$/)
          elsif highlight.kind_of? Proc # evaluate the proc
            h = highlight.call
            if (h.is_a?(TrueClass) || h.is_a?(FalseClass))
              highlighted &= h
            else
              raise 'proc highlighting rules must evaluate to TrueClass or FalseClass'
            end
          elsif highlight.kind_of? Hash # evaluate the hash
            h = clean_unwanted_keys(highlight)
            h.each_key do |key|   # for each key
              
              options[key].to_s.gsub!(/^\//,"") 
              # get the value for the key
              value=h[key]
              if value.kind_of?Array
                value.each do |controller_name|
                  controller_name.gsub!(/^\//,"")
                  #  p options[key]
                  # p highlight
                  return  highlighted if controller_name==options[key].to_s
                end
                return false
              else
                
                # remove first slash from <tt>:controller</tt> key otherwise highlighted? could fail with urls such as {:controller => "/base"</tt>
                h_key = h[key].to_s.dup
                h_key.gsub!(/^\//,"") if key == :controller 
             
             
                #  p options[key]
                #      p highlight
                highlighted &= h_key==options[key].to_s
              end
             
            end
          else # highlighting rule not supported
            raise 'highlighting rules should be String, Proc or Hash' 
          end
          result |= highlighted
        end
        return result
      end
      
      private  
      
      # removes unwanted keys from a Hash 
      # and returns a new hash
      def clean_unwanted_keys(hash)
        ignored_keys = [:only_path, :use_route]
        hash.dup.delete_if{|key,value| ignored_keys.include?(key)}
      end

      def check_hash(param, param_name)
        raise "param '#{param_name}' should be a Hash but is #{param.inspect}" unless param.kind_of?(Hash)
        param
      end
    end
  end
end
