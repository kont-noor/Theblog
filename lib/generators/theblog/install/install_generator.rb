class Theblog::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("../../templates", __FILE__)

  def install
    route "mount Theblog::Engine => '/blog'"

    append_to_file "db/seeds.rb", "Theblog::Engine.load_seed"
    copy_file "theblog.rb", "config/initializers/theblog.rb"
  end
end
