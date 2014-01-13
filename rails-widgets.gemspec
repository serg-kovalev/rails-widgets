lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-widgets/version'

Gem::Specification.new do |spec|
  spec.name = "rails-widgets"
  spec.version = RailsWidgets::VERSION
  spec.authors = [ 'Siarhei Kavaliou, Paolo Dona' ]
  spec.email = 'siarhei_kavaliou@epam.com'
  spec.summary = 'Widgets is a collection of UI Widgets for RubyOnRails'
  spec.homepage = 'https://github.com/serg-kovalev/rails-widgets'
  spec.license = 'MIT'
  spec.date = Time.now.strftime('%Y-%m-%d')

  spec.files = `git ls-files`.split($/) 
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'

  spec.description = <<desc
Rails Widgets is a collection of UI Widgets for RubyOnRails (in form of ActionView helpers).
You can add tabbed navigations, progressbars, rounded boxes etc in a snap.
All the widgets generate and inline their own CSS. Once your page is up and running you can extract and customize them as you wish.
desc
end
