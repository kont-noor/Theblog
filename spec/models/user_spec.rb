require 'rails_helper'

RSpec.describe User, :type => :model do
  subject{ FactoryGirl.build(:user) }
  it { is_expected.to validate_presence_of(:user_name) }
  it { is_expected.to validate_uniqueness_of(:user_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
end
