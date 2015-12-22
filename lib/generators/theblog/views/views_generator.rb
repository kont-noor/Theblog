class Theblog::ViewsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/views', __FILE__)

  def copy_views
    views_pattern = File.join self.class.source_root, "**/theblog/**/*.haml"

    Dir.glob(views_pattern).each do |entry|
      unless entry =~ /admin/
        copy_file entry, "app/views/#{entry.match(/(?<=views\/).+/)}"
      end
    end
  end
end
