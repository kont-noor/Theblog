require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    let(:user){ FactoryGirl.create(:confirmed_user) }
    it "returns http success" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "redirects to login" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
