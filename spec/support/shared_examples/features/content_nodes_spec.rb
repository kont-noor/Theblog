require 'rails_helper'

RSpec.shared_examples :frontend_content_node do
  it "displays node" do
    visit(theblog.root_content_node_path(subject.slug))

    expect(page).to have_content(subject.title)
    expect(page).to have_content(subject.description)
    expect(page).to have_content(subject.body)
  end

  it "doesn't display drafted node" do
    subject.draft!
    visit(theblog.root_content_node_path(subject.slug))

    expect(page).to have_no_content(subject.title)
  end

  it "doesn't display blocked node" do
    subject.block!
    visit(theblog.root_content_node_path(subject.slug))

    expect(page).to have_no_content(subject.title)
  end

  it "displays node by parent" do
    parent = FactoryGirl.create(:category)
    subject.update(parent_node: parent)

    visit(theblog.content_node_path(parent.slug, subject.slug))

    expect(page).to have_content(subject.title)
    expect(page).to have_content(subject.description)
    expect(page).to have_content(subject.body)
  end
end
