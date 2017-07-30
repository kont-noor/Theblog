require 'pundit'
require 'aasm'
require 'kaminari'
require 'jquery-rails'
require 'sass'
require 'bootstrap-sass'
require 'bootstrap-wysihtml5-rails'
require 'foreigner' if Rails::VERSION::STRING < "4.2"

module Theblog
  class Engine < ::Rails::Engine
    isolate_namespace Theblog
    require 'theblog/concerns/controllers/itemable'

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    config.to_prepare do
      Rails.application.config.assets.precompile += %w(
        theblog/*
      )
    end
  end
end
