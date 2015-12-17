require 'rails_helper'

module Theblog
  RSpec.describe Category, :type => :model do
    it { is_expected.to have_many(:posts) }
  end
end
