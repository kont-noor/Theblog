require 'rails_helper'

module Yablog
  RSpec.describe ContentNode, :type => :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
