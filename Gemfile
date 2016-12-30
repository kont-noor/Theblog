source "https://rubygems.org"

# Declare your gem's dependencies in theblog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.
gem 'devise', '3.5.1'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

group :test do
  gem 'shoulda'
  gem 'simplecov'
  gem 'capybara'
  gem 'fantaskspec'
  gem 'generator_spec'
end
