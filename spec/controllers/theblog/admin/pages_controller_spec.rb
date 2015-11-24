require 'rails_helper'

module Theblog
  describe Admin::PagesController, type: :controller do
    routes { Theblog::Engine.routes }

    let(:account) { FactoryGirl.create(:confirmed_account) }
    let(:page) { FactoryGirl.create(:page) }

    before { sign_in account }

    describe "#update" do
      it "raises exception if user tries to update another page" do
        expect{ patch :update, id: page.id }.
          to raise_error(Pundit::NotAuthorizedError)
      end

      it "updates page if user is author" do
        page.update(author: account)

        patch :update, id: page.id, page: { body: "test controller body" }

        expect(response).to redirect_to(action: :show)
        expect(page.reload.body).to eq("test controller body")
      end
    end
  end
end
