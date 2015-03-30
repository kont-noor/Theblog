require 'rails_helper'

describe 'admin pages' do
  let!(:user){ Yablog::User.create email: 'fake@mail.com', user_name: 'username', password: 'password', confirmed_at: Time.zone.now }

  it "should manage pages" do
    visit "yablog/admin"

    expect(page).to have_content('Log in')

    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')
    click_on('Log in')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Admin Dashboard')

    within('.sidebar') do
      click_on "Pages"
    end
    click_on "New Item"

    expect(page).to have_content('New')

    fill_in('Title', with: 'Page title')
    fill_in('Slug', with: 'page_slug')
    fill_in('Description', with: "Some page description")
    fill_in('Body', with: "Lorem Ipsum")
    fill_in('Tags', with: "tag1, tag2")

    click_on('Create Page')

    expect(page).to have_content('Item created')
    expect(page).to have_content('Page title')
    expect(page).to have_content('Some page description')
    expect(page).to have_content('Lorem Ipsum')

    click_on('View')

    expect(page).to have_content('Page title')
    expect(page).to have_content('Some page description')
    expect(page).to have_content('Lorem Ipsum')

    visit('/yablog/admin/pages')
    click_on('Edit')

    fill_in('Title', with: "New page name")
    click_on('Update Page')

    expect(page).to have_content('Item updated')
    expect(page).to have_content('New page name')
    expect(page).to have_no_content('Page title')
  end
end
