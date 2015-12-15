require 'rails_helper'

RSpec.shared_examples :admin_content_node do
  let(:node_button) { node_name.to_s.humanize }

  let!(:subject_node) { FactoryGirl.create node_name, author: account }
  let!(:blocked_node) { FactoryGirl.create "blocked_#{node_name}", author: account }

  before do
    another_account = FactoryGirl.create :confirmed_account
    FactoryGirl.create node_name, author: another_account

    login_with(account)

    within('.sidebar') do
      click_on node_button.pluralize
    end
  end

  it "creates node" do
    click_on "New Item"

    expect(page).to have_content('New')

    fill_in('Title', with: 'Node title')
    fill_in('Slug', with: 'node_slug')
    fill_in('Description', with: "Some node description")
    fill_in('Body', with: "Lorem Ipsum")
    fill_in('Tags', with: "tag1, tag2")

    click_on("Create #{node_button}")

    expect(page).to have_content('Item created')
    expect(page).to have_content('Node title')
    expect(page).to have_content('Some node description')
    expect(page).to have_content('Lorem Ipsum')

    click_on_within_node("Node title", "View")

    expect(page).to have_content('Node title')
    expect(page).to have_content('Some node description')
    expect(page).to have_content('Lorem Ipsum')
  end

  it "updates node" do
    expect(page).to have_content(subject_node.title)

    click_on_within_node(subject_node.title, "Edit")

    fill_in('Title', with: "New node name")
    click_on("Update #{node_button}")

    expect(page).to have_content('Item updated')
    expect(page).to have_content('New node name')
    expect(page).to have_no_content(subject_node.title)
  end

  it "drafts and publishes node" do
    expect(page).to have_content(subject_node.title)

    within node_row(subject_node) do
      expect(page).to have_content("published")
      expect(page).to have_link("Draft")
      expect(page).to have_no_link("Publish")

      expect(page).to have_no_link("Block")
      expect(page).to have_no_link("Unblock")
    end

    click_on_within_node(subject_node, "Draft")

    expect(page).to have_content("Item is drafted")

    within node_row(subject_node) do
      expect(page).to have_content("drafted")
      expect(page).to have_link("Publish")
      expect(page).to have_no_link("Draft")
    end

    click_on_within_node(subject_node, "Publish")

    expect(page).to have_content("Item is published")

    within node_row(subject_node) do
      expect(page).to have_content("published")
      expect(page).to have_link("Draft")
      expect(page).to have_no_link("Publish")
    end
  end

  it "moderator blocks and unblocks node" do
    add_role(account, :moderator)

    within('.sidebar') do
      click_on node_button.pluralize
    end

    expect(page).to have_content(subject_node.title)

    within node_row(subject_node) do
      expect(page).to have_content("published")
      expect(page).to have_link("Draft")
      expect(page).to have_no_link("Publish")
      expect(page).to have_link("Block")
      expect(page).to have_no_link("Unblock")
    end

    click_on_within_node(subject_node, "Block")

    expect(page).to have_content("Item is blocked")

    within node_row(subject_node) do
      expect(page).to have_content("blocked")
      expect(page).to have_link("Unblock")
      expect(page).to have_no_link("Block")
      expect(page).to have_no_link("Publish")
      expect(page).to have_no_link("Draft")
    end

    click_on_within_node(subject_node, "Unblock")

    expect(page).to have_content("Item is unblocked")

    within node_row(subject_node) do
      expect(page).to have_content("drafted")
      expect(page).to have_no_link("Unblock")
      expect(page).to have_link("Block")
      expect(page).to have_link("Publish")
      expect(page).to have_no_link("Draft")
    end
  end

  it "can neither draft or publish blocked nodes" do
    expect(page).to have_content(blocked_node.title)

    within node_row(blocked_node) do
      expect(page).to have_content("blocked")
      expect(page).to have_no_link("Draft")
      expect(page).to have_no_link("Block")
      expect(page).to have_no_link("Unblock")
      expect(page).to have_no_link("Publish")
    end
  end

  def add_role(account, role)
    Theblog::Role.find_by(name: role).accounts << account
  end

  def click_on_within_node(node, link_title)
    within node_row(node) do
      click_on link_title
    end
  end

  def node_row(node)
    title = node.is_a?(String) ? node : node.title
    "tr:contains('#{title}')"
  end

  def login_with(account)
    visit theblog.admin_root_path

    expect(page).to have_content('Log in')

    fill_in('Email', with: account.email)
    fill_in('Password', with: 'qwertyui')
    click_on('Log in')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Admin Dashboard')
  end
end
