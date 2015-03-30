$:.push File.expand_path("../lib", __FILE__)

# Maintain your gems version:
require "yablog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "yablog"
  s.version     = Yablog::VERSION
  s.authors     = ["Nickolay Kondratenko"]
  s.email       = ["devmarkup@gmail.com"]
  s.homepage    = "https://github.com/kont-noor"
  s.summary     = "Yet Another WebLog engine"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency "haml", "~> 4.0"
  s.add_dependency "simple_form", "~> 3.0"

  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"

  s.add_dependency "rails-assets-font-awesome"
  s.add_dependency "rails-assets-metisMenu"
  s.add_dependency "rails-assets-morrisjs"
  s.add_dependency "rails-assets-bootstrap-social"

  s.add_development_dependency "pg", "~> 0.17"
end
