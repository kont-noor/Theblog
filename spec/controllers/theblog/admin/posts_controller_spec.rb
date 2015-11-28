require 'rails_helper'

module Theblog
  describe Admin::PostsController, type: :controller do
    routes { Theblog::Engine.routes }

    let(:account) { FactoryGirl.create(:confirmed_account) }
    let(:the_post) { FactoryGirl.create(:post) }

    before { sign_in account }

    describe "PATCH #update" do
      it "raises exception if user tries to update another the_post" do
        expect{ patch :update, id: the_post.id }.
          to raise_error(Pundit::NotAuthorizedError)
      end

      it "updates the_post if user is author" do
        the_post.update(author: account)

        patch :update, id: the_post.id, post: { body: "test controller body" }

        expect(response).to redirect_to(action: :show)
        expect(the_post.reload.body).to eq("test controller body")
      end
    end

    describe "POST #create" do
      it "raises exception if user is not an editor" do
        expect{ post :create }.
          to raise_error(Pundit::NotAuthorizedError)
      end

      it "creates the_post if user has an editor role" do
        Theblog::Role.find_by(name: :editor).accounts << account

        post :create, post: { body: "test controller body", title: "title", slug: "slug" }

        expect(response).to redirect_to(action: :index)

        post = Theblog::Post.last
        expect(post.body).to eq("test controller body")
        expect(post.title).to eq("title")
        expect(post.slug).to eq("slug")
      end
    end
  end
end
