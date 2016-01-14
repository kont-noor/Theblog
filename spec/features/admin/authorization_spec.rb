require 'rails_helper'

describe 'authorization' do
  let(:account) { FactoryGirl.create(:confirmed_account) }

  it 'logs in' do
    visit admin_root_path

    expect(page).to have_content('Log in')

    fill_in('Email', with: account.email)
    fill_in('Password', with: 'qwertyui')
    click_on('Log in')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Admin Dashboard')
  end
end