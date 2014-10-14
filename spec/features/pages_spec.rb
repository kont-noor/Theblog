require 'rails_helper'

describe "pages" do
  let(:user){ FactoryGirl.create(:confirmed_user) }

  it "create new page" do
    visit "/yablog/pages/new"
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    within('#new_user') do
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    expect(page).to have_content('Signed in successfully')

    within('#new_page') do
      fill_in 'Title', with: "Title"
      fill_in 'Slug', with: 'slug'
      fill_in 'Description', with: 'Some page description'
      fill_in 'Body', with: 'Lorem ipsum dolor sit amet'
      click_on 'Create Page'
    end

    expect(page).to have_content('Page has been created')

    visit("/yablog/slug")

    expect(page).to have_content('Title')
    expect(page).to have_content('Some page description')
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end
end
