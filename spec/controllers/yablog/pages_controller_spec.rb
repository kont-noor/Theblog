require 'rails_helper'

module Yablog
  RSpec.describe PagesController, :type => :controller do
    describe "GET show" do
      it "should find page by slug" do
        expect(Page).to receive(:find).with("1"){ double(:page) }
        get :show, id: 1
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end

      it "should find page by id" do
        expect(Page).to receive(:find_by_slug).with("slug"){ double(:page) }
        get :show, slug: "slug"
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end

      it "should raise RoutingError if page not found" do
        expect(Page).to receive(:find).with("1")
        expect{ get :show, id: 1 }.to raise_error(ActionController::RoutingError)
      end
    end

    describe "non logged in" do
      it "GET new redirects to login" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end

      it "POST create redirects to login" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end

      it "GET edit redirects to login" do
        get :edit, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end

      it "PUT update redirects to login" do
        put :update, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "logged in user" do
      let(:user){ FactoryGirl.create(:confirmed_user) }
      before{ sign_in user }

      it "GET new should render new template" do
        get :new
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
        expect(assigns(:page)).to be_a(Page)
      end

      it "GET edit should render edit template" do
        page = double(:page)
        expect(Page).to receive(:find).with("1"){ page }
        get :edit, id: 1
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:edit)
        expect(assigns(:page)).to eq(page)
      end
    end
  end
end
