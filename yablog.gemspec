$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
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
  s.add_dependency "bootstrap-sass", "~> 3.2.0"
  s.add_dependency "sass-rails", "~> 4.0.2"
  s.add_dependency "jquery-rails", "~> 3.1.2"
  s.add_dependency "ckeditor"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency "uglifier"

  s.add_development_dependency "pg", "~> 0.17"
end
