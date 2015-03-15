require 'rails_helper'

describe 'categories' do
  it "should display category and posts" do
      category = FactoryGirl.create(:category, title: "Category", slug: "category", description: "category_description")
      FactoryGirl.create(:post, title: "Post1 Title", slug: "slug",
                         description: "Some post1 description", body: "Lorem ipsum dolor sit amet",
                         parent_node: category)
      FactoryGirl.create(:post, title: "Post2 Title", slug: "slug2",
                         description: "Some post1 description", body: "Lorem ipsum dolor sit amet",
                         parent_node: category)
      FactoryGirl.create(:post, title: "Post3 Title", slug: "slug3",
                         description: "Some post1 description", body: "Lorem ipsum dolor sit amet")

      visit("/yablog/category")

      expect(page).to have_content('Category')
      expect(page).to have_content('category_description')
      expect(page).to have_content('Post1 Title')
      expect(page).to have_content('Post2 Title')
      expect(page).to have_no_content('Post3 Title')
  end
end
