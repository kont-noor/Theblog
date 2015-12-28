class Theblog::InstallGenerator < Rails::Generators::Base
  def install
    route "mount Theblog::Engine => '/blog'"
    route "mount Incarnator::Engine => '/auth'"

    append_to_file "db/seeds.rb", "Theblog::Engine.load_seed"
  end
end
