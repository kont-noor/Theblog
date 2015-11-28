require 'rails_helper'

describe 'posts' do
  describe "show post" do
    let!(:account){ FactoryGirl.create :confirmed_account }

    it "display post by slug" do
      visit "theblog/admin"

      expect(page).to have_content('Log in')

      fill_in 'Email', with: account.email
      fill_in 'Password', with: 'qwertyui'
      click_on 'Log in'

      expect(page).to have_content('Signed in successfully')

      category = FactoryGirl.create(:category, title: "Category", slug: "category")
      FactoryGirl.create(:post, title: "Post Title", slug: "slug",
                         description: "Some post description", body: "Lorem ipsum dolor sit amet",
                         parent_node: category)

      visit("/theblog/category/slug")

      expect(page).to have_content('Post Title')
      fill_in 'comment_body', with: 'Comment body'

      click_on 'Save'

      expect(page).to have_content 'Comment body'
    end
  end
end
