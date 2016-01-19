require 'rails_helper'

module Theblog
  RSpec.describe Comment, type: :model do
    it { is_expected.to belong_to(:post) }

    it { is_expected.to validate_presence_of(:body) }
  end
end
