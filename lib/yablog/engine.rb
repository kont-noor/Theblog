module Yablog
  class Engine < ::Rails::Engine
    isolate_namespace Yablog

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer "yablog.assets.precompile" do |app|
      app.config.assets.precompile += Ckeditor.assets
      app.config.assets.precompile += %w( ckeditor/* )
    end

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
  end
end
