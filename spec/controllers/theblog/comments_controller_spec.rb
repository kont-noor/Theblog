require 'rails_helper'

module Theblog
  RSpec.describe CommentsController, type: :controller do
    routes { Theblog::Engine.routes }

    let(:theblog_post) { FactoryGirl.create(:post) }
    let(:account){ FactoryGirl.create(:confirmed_account) }

    before do
      sign_in account
    end

    describe "POST #create" do
      it "creates new comment" do
        expect(Theblog::Post).to receive(:find_by!).with(id: theblog_post.id.to_s).and_return(theblog_post)

        expect{
          post :create, comment: {body: 'Some comment', parent_node_id: theblog_post.id}
        }.to change(Theblog::Comment, :count).by(1)

        expect(response).to redirect_to root_content_node_path(theblog_post.slug)
      end
    end

    describe "DELETE #destroy" do
      let(:comment) { FactoryGirl.create(:theblog_comment, author: account, post: theblog_post)}

      it "deletes comment" do
        expect(Theblog::Comment).to receive(:find).with(comment.id.to_s).and_return(comment)

        expect{
          delete :destroy, id: comment.id
        }.to change(Theblog::Comment, :count).by(-1)

        expect(response).to redirect_to root_content_node_path(comment.post.slug)
      end

      it "checks permissions" do
        expect(Theblog::Comment).to receive(:find).with(comment.id.to_s).and_return(comment)
        expect(controller).to receive(:authorize).with(comment, :delete?)
        delete :destroy, id: comment.id
      end
    end
  end
end
