require 'rails_helper'
describe Theblog::CommentPolicy do
  subject { described_class }

  let(:account){ FactoryGirl.create(:confirmed_account) }
  let(:admin_account) { FactoryGirl.create(:admin) }
  let(:account_comment) { FactoryGirl.create(:theblog_comment, author: account) }
  let(:another_comment) { FactoryGirl.create(:theblog_comment) }

  permissions :update? do
    it "denies access if post is published by another user" do
      expect(subject).not_to permit(account, another_comment)
    end

    it "grants access if post is published by user" do
      expect(subject).to permit(account, account_comment)
    end

    it "grants access if user is admin" do
      expect(subject).to permit(admin_account, another_comment)
    end
  end

  permissions :delete? do
    it "denies access if post is published by another user" do
      expect(subject).not_to permit(account, another_comment)
    end

    it "grants access if post is published by user" do
      expect(subject).to permit(account, account_comment)
    end

    it "grants access if user is admin" do
      expect(subject).to permit(admin_account, another_comment)
    end
  end
end
