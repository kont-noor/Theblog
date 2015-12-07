require 'rails_helper'

module Theblog
  describe Admin::PagesController, type: :controller do
    routes { Theblog::Engine.routes }

    let(:account) { FactoryGirl.create(:confirmed_account) }
    let(:page) { FactoryGirl.create(:page) }

    before { sign_in account }

    describe "PATCH #update" do
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

    describe "POST #create" do
      it "raises exception if user is not an editor" do
        expect{ post :create }.
          to raise_error(Pundit::NotAuthorizedError)
      end

      it "creates page if user has an editor role" do
        Theblog::Role.find_by(name: :editor).accounts << account

        post :create, page: { body: "test controller body", title: "title", slug: "slug" }

        expect(response).to redirect_to(action: :index)

        page = Theblog::Page.last
        expect(page.body).to eq("test controller body")
        expect(page.title).to eq("title")
        expect(page.slug).to eq("slug")
      end
    end
  end
end
