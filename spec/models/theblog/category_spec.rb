require 'rails_helper'

module Theblog
  RSpec.describe Category, :type => :model do
    it { is_expected.to have_many(:posts) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
