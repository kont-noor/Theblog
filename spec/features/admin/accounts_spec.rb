require 'rails_helper'

describe 'admin accounts' do
  let!(:account) { FactoryGirl.create(:admin) }

  let(:node_name) { :page }

  before { login_as(account) }

  it "creates account" do
    visit admin_accounts_path

    click_on "New Item"

    expect(page).to have_content('New')

    fill_in('User name', with: 'johndoe')
    fill_in('First name', with: 'John')
    fill_in('Middle name', with: 'Steven')
    fill_in('Last name', with: 'Doe')
    fill_in('Email', with: 'test@lk.lk')
    fill_in('Password', with: 'simpleone')
    fill_in('Password confirmation', with: 'simpleone')
    check('editor')

    click_on("Create Account")

    expect(page).to have_content('johndoe')
    expect(page).to have_content('John')
    expect(page).to have_content('Steven')
    expect(page).to have_content('Doe')
    expect(page).to have_content('test@lk.lk')
    expect(page).to have_content('editor')
  end

  it "updates account" do
    FactoryGirl.create(:account)

    visit admin_accounts_path

    page.all('a', text: 'Edit').first.click

    fill_in('User name', with: 'johndoe')
    fill_in('First name', with: 'John')
    fill_in('Middle name', with: 'Steven')
    fill_in('Last name', with: 'Doe')
    fill_in('Email', with: 'test@lk.lk')
    fill_in('Password', with: 'simpleone')
    fill_in('Password confirmation', with: 'simpleone')
    check('editor')

    click_on("Update Account")

    expect(page).to have_content('johndoe')
    expect(page).to have_content('John')
    expect(page).to have_content('Steven')
    expect(page).to have_content('Doe')
    expect(page).to have_content('test@lk.lk')
    expect(page).to have_content('editor')
  end

  it "destroys account" do
    another_account = FactoryGirl.create(:account)

    visit admin_accounts_path

    page.all('a', text: 'Delete').first.click

    expect(page).not_to have_content(another_account.email)
  end
end
