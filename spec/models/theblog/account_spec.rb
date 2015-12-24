require 'rails_helper'

module Theblog
  RSpec.describe Account, :type => :model do
    it { is_expected.to have_many(:accounts_role) }
    it { is_expected.to have_many(:roles) }

    describe '#has_role?' do
      let(:account) { FactoryGirl.create :confirmed_account }
      let(:role) { 'admin' }

      subject { account.has_roles?(role) }

      context 'role exists' do
        before { account.roles << Theblog::Role.find_by(name: role) }

        it { is_expected.to be_truthy }
      end

      context "role doesn't exist" do
        it { is_expected.to be_falsey }
      end
    end
  end
end
