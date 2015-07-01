require 'rails_helper'

module Yablog
  RSpec.describe User, :type => :model do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_uniqueness_of(:user_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
