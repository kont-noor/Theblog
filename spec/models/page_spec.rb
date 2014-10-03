require 'rails_helper'

RSpec.describe Page, :type => :model do
  subject { FactoryGirl.build(:page) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_uniqueness_of(:slug) }
end
