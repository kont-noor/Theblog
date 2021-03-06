require 'rails_helper'

describe 'categories' do
  subject { FactoryGirl.create(:category) }

  it_behaves_like :frontend_content_node

  it "displays category and it's published posts" do
    own_posts = FactoryGirl.create_list(:post, 3, parent_node: subject)
    foreign_post = FactoryGirl.create(:post)

    own_non_published_posts = [:drafted, :blocked].map do |status|
      FactoryGirl.create("#{status}_post", parent_node: subject)
    end

    visit(theblog.root_content_node_path(subject.slug))

    own_posts.each do |post|
      expect(page).to have_content(post.title)
    end

    expect(page).to have_no_content(foreign_post.title)

    own_non_published_posts.each do |post|
      expect(page).to have_no_content(post.title)
    end
  end

  it "displays posts with pagination" do
    posts = FactoryGirl.create_list(:post, 100, parent_node: subject)

    visit(theblog.root_content_node_path(subject.slug))

    expect(all("ul.posts>li").count).to eq(25)
    posts[-25...-1].each do |post|
      expect(page).to have_content(post.title)
    end

    click_on("Next ›")

    expect(all("ul.posts>li").count).to eq(25)
    posts[-50...-25].each do |post|
      expect(page).to have_content(post.title)
    end
  end
end
