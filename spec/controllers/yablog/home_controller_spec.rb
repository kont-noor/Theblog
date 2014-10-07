require 'rails_helper'

module Yablog
  RSpec.describe HomeController, :type => :controller do

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

      it "renders page template if any page exists" do
        Page.create(title: "Home", slug: 'home', body: "text")
        get :index

        expect(response).to render_template("pages/show")
      end
    end

  end
end
