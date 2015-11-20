require 'rails_helper'

describe 'admin dashboard' do
  let!(:account){ FactoryGirl.create :confirmed_account }

  it "should require account login" do
    visit "/yablog/admin"

    expect(page).to have_content('Log in')

    fill_in('Email', with: account.email)
    fill_in('Password', with: 'qwertyui')
    click_on('Log in')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Admin Dashboard')
  end
end
