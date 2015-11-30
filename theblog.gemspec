$:.push File.expand_path("../lib", __FILE__)

# Maintain your gems version:
require "theblog/version"
require 'rubygems'

rails_gem = Gem::Specification.select {|z| z.name == "rails"}.max_by {|a| a.version}

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "theblog"
  s.version     = Theblog::VERSION
  s.authors     = ["Nickolay Kondratenko"]
  s.email       = ["devmarkup@gmail.com"]
  s.homepage    = "https://github.com/kont-noor"
  s.summary     = "Yet Another WebLog engine"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0.1"
  if rails_gem.version.version < '4.2'
    s.add_dependency "foreigner"
  end
  s.add_dependency "haml", "~> 4.0"
  s.add_dependency "simple_form", "~> 3.0"
  s.add_dependency "incarnator", "~> 0.0.1.1"

  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"

  s.add_dependency "bootstrap-wysihtml5-rails"

  s.add_dependency "rails-assets-font-awesome"
  s.add_dependency "rails-assets-metisMenu"
  s.add_dependency "rails-assets-morrisjs"
  s.add_dependency "rails-assets-bootstrap-social"

  s.add_development_dependency "pg", "~> 0.17"
end