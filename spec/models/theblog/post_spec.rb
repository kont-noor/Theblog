require 'rails_helper'

module Theblog
  RSpec.describe Post, type: :model do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:comments) }

    it { is_expected.to belong_to(:category) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
