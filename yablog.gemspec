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

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "devise"
  s.add_dependency "haml"
  s.add_dependency "simple_form"

  s.add_development_dependency "pg"
end
