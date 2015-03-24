require 'rails_helper'

module Yablog
  RSpec.describe HomeController, :type => :controller do
    routes { Yablog::Engine.routes }

    describe "GET index" do
      let(:user){ FactoryGirl.create(:confirmed_user) }
      it "returns http success" do
        sign_in user
        get :index
        expect(response).to have_http_status(:success)
      end

      it "renders own template" do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

  end
end
