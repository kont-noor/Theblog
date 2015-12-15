require 'rails_helper'

RSpec.shared_examples :admin_content_nodes_controller_update do
  it "raises exception if user tries to update another content_node" do
    expect{ patch :update, id: content_node.id }.
      to raise_error(Pundit::NotAuthorizedError)
  end

  it "raises exception if user tries to update own post but is no longer editor" do
    content_node.update(author: account)

    expect{ patch :update, id: content_node.id }.
      to raise_error(Pundit::NotAuthorizedError)
  end

  it "updates content_node if user is author and is editor" do
    content_node.update(author: account)
    Theblog::AccountsRole.create!(account: account, role: Theblog::Role.find_by(name: :editor))

    patch :update, id: content_node.id, content_node_key => { body: "test controller body" }

    expect(response).to redirect_to(action: :show)
    expect(content_node.reload.body).to eq("test controller body")
  end
end

RSpec.shared_examples :admin_content_nodes_controller_create do
  it "raises exception if user is not an editor" do
    expect{ post :create }.
      to raise_error(Pundit::NotAuthorizedError)
  end

  it "creates post if user has an editor role" do
    Theblog::Role.find_by(name: :editor).accounts << account

    post :create, content_node_key => { body: "test controller body", title: "title", slug: "slug" }

    expect(response).to redirect_to(action: :index)

    loaded_node = content_node.class.order(:created_at).first
    expect(loaded_node.body).to eq("test controller body")
    expect(loaded_node.title).to eq("title")
    expect(loaded_node.slug).to eq("slug")
  end
end
