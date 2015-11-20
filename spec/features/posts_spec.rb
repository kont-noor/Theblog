require 'rails_helper'

describe 'posts' do
  describe "show post" do
    it "display post by slug" do
      category = FactoryGirl.create(:category, title: "Category", slug: "category")
      FactoryGirl.create(:post, title: "Post Title", slug: "slug",
                         description: "Some post description", body: "Lorem ipsum dolor sit amet",
                         parent_node: category)

      visit("/theblog/category/slug")

      expect(page).to have_content('Post Title')
      expect(page).to have_content('Some post description')
      expect(page).to have_content('Lorem ipsum dolor sit amet')
    end
  end
end
