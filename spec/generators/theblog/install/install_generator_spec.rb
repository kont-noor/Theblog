require "rails_helper"
require "generators/theblog/install/install_generator"

describe Theblog::InstallGenerator, type: :generator do
  destination File.expand_path("../tmp", Rails.root)

  let(:seeds_file) { File.expand_path("../tmp/db/seeds.rb", Rails.root) }
  let(:routes_file) { File.expand_path("../tmp/config/routes.rb", Rails.root) }
  let(:initializer_file) { File.expand_path("../tmp/config/initializers/theblog.rb", Rails.root) }

  before do
    prepare_destination

    FileUtils.mkdir(File.expand_path("../tmp/config", Rails.root))
    File.open(routes_file, "w") do |f|
      f << "Rails.application.routes.draw do\n"
      f << "end"
    end
    FileUtils.mkdir(File.expand_path("../tmp/db", Rails.root))
    FileUtils.touch(seeds_file)
    run_generator
  end

  it "mounts blog to routes" do
    routes = File.read(routes_file)
    expect(routes).to eq("Rails.application.routes.draw do\n" \
                         "  mount Theblog::Engine => '/blog'\nend")
  end

  it "copies initializer" do
    routes = File.read(initializer_file)
    expect(routes).to eq("Theblog.setup do |config|\n  config.account_model = \"Incarnator::Account\"\nend\n")
  end

  it "adds blog seeds to application seeds" do
    seeds = File.read(seeds_file)
    expect(seeds).to eq("Theblog::Engine.load_seed")

    run_generator

    seeds = File.read(seeds_file)
    expect(seeds).to eq("Theblog::Engine.load_seed")
  end
end
