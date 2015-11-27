require 'rails_helper'

module Theblog
  RSpec.describe AccountsRole, :type => :model do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:role) }

    it { is_expected.to validate_presence_of(:account) }
    it { is_expected.to validate_presence_of(:role) }
  end
end
