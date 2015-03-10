require 'rails_helper'

module Yablog
  RSpec.describe ContentNodesController, :type => :controller do
    routes { Yablog::Engine.routes }

    describe "GET show" do
      it "should find node by slug" do
        category_posts = double(:category_posts)
        expect(ContentNode).to receive(:by_parent).with("test_category").and_return(category_posts)
        expect(category_posts).to receive(:find_by!).with(slug: "test_post").and_return(double(:post))
        get :show, category: "test_category", slug: "test_post"
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end
  end
end
