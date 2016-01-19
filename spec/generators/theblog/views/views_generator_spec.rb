require "rails_helper"
require "generators/theblog/views/views_generator"

describe Theblog::ViewsGenerator, type: :generator do
  destination File.expand_path("../tmp", Rails.root)

  it "copies engine views" do
    prepare_destination
    Dir.chdir(destination_root)

    expect(Dir.glob("**/**")).to eq([])

    run_generator

    expect(Dir.glob("**/**")).to contain_exactly(
      "app",
      "app/views",
      "app/views/layouts",
      "app/views/layouts/theblog",
      "app/views/layouts/theblog/application.html.haml",
      "app/views/theblog",
      "app/views/theblog/comments",
      "app/views/theblog/comments/_block.html.haml",
      "app/views/theblog/content_nodes",
      "app/views/theblog/content_nodes/show.html.haml",
      "app/views/theblog/home",
      "app/views/theblog/home/index.html.haml"
    )
  end
end
