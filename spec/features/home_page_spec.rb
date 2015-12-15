require 'rails_helper'

describe 'pages' do
  let(:homepage) { FactoryGirl.create(:page, slug: :home) }

  context "default page" do
    let!(:pages) { FactoryGirl.create_list(:page, 3) }

    it "displays page with slug /home" do
      # touch homepage to save it
      homepage
      visit(theblog.root_path)

      expect(page).to have_content(homepage.description)
      pages.each{ |p| expect(page).not_to have_content(p.description) }
    end

    it "displays first created page unless there is any page with slug /home" do
      visit(theblog.root_path)

      expect(page).to have_content(pages.first.description)
      expect(page).to have_no_content(homepage.description)
      expect(page).to have_no_content(pages[1].description)
      expect(page).to have_no_content(pages.last.description)
    end
  end

  context "posts on the main page" do
    let!(:posts) { FactoryGirl.create_list(:post, 100) }

    it "displays posts with pagination" do
      visit(theblog.root_path)

      expect(all(".post-preview").count).to eq(25)
      posts[-25...-1].each do |post|
        expect(page).to have_content(post.title)
      end

      click_on("Next ›")

      expect(all(".post-preview").count).to eq(25)
      posts[-50...-25].each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end
end
