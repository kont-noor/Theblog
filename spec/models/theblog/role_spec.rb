require 'rails_helper'

module Theblog
  RSpec.describe Role, :type => :model do
    it { is_expected.to have_many(:accounts_roles) }
    it { is_expected.to have_many(:accounts) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
