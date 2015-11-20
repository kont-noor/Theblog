require 'rails_helper'

module Theblog
  RSpec.describe ContentStatus, :type => :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
