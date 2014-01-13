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

  spec.files = ["CHANGELOG", "Documentation.txt", "Gemfile", "LICENSE", "README", "Rakefile", "generators/navigation/USAGE", "generators/navigation/navigation_generator.rb", 
"generators/navigation/templates/navigation.html.erb", "generators/tabnav/USAGE", "generators/tabnav/tabnav_generator.rb", "generators/tabnav/templates/tabnav.html.erb", 
"images/tooltip_arrow.gif", "images/tooltip_image.gif", "init.rb", "install.rb", "javascripts/tooltip.js", "lib/widgets.rb", "lib/widgets/code.css.erb", 
"lib/widgets/code_helper.rb", "lib/widgets/core.rb", "lib/widgets/css_template.rb", "lib/widgets/disableable.rb", "lib/widgets/highlightable.rb", 
"lib/widgets/navigation.css.erb", "lib/widgets/navigation.rb", "lib/widgets/navigation_helper.rb", "lib/widgets/navigation_item.rb", "lib/widgets/progressbar.css.erb", 
"lib/widgets/progressbar_helper.rb", "lib/widgets/showhide.css.erb", "lib/widgets/showhide_helper.rb", "lib/widgets/spiffy_corners/spiffy5.html.erb", 
"lib/widgets/spiffy_corners/spiffy_corners.css.erb", "lib/widgets/spiffy_corners/spiffy_corners_helper.rb", "lib/widgets/tab.rb", "lib/widgets/table.css.erb", 
"lib/widgets/table_helper.rb", "lib/widgets/tabnav.css.erb", "lib/widgets/tabnav.rb", "lib/widgets/tabnav_helper.rb", "lib/widgets/tooltip.css.erb", 
"lib/widgets/tooltip_helper.rb", "lib/widgets/utils_helper.rb", "lib/rails-widgets/version.rb", "tasks/widgets_tasks.rake", "test/disableable_test.rb", 
"test/highlightable_test.rb", "test/navigation_helper_test.rb", "test/showhide_helper_test.rb", "test/spiffy_corners/simple.html", 
"test/spiffy_corners/spiffy_corners_test.rb", "test/tab_test.rb", "test/table_helper_test.rb", "test/tabnav_helper_test.rb", "test/tabnav_test.rb", "test/test_helper.rb", 
"test/tooltip_helper_test.rb", "uninstall.rb", "rails-widgets.gemspec"]
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'

  spec.description = <<desc
Rails Widgets is a collection of UI Widgets for RubyOnRails (in form of ActionView helpers).
You can add tabbed navigations, progressbars, rounded boxes etc in a snap.
All the widgets generate and inline their own CSS. Once your page is up and running you can extract and customize them as you wish.
desc
end
