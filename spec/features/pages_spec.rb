require 'rails_helper'

describe "pages" do
  it "show page" do
    FactoryGirl.create(:page, title: "Title", slug: "slug",
                       description: "Some page description", body: "Lorem ipsum dolor sit amet")

    visit("/theblog/slug")

    expect(page).to have_content('Title')
    expect(page).to have_content('Some page description')
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end
end
