require 'rails_helper'

module Theblog
  RSpec.describe ContentNode, :type => :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }

    describe "#content_status" do
      it "initializes with drafted" do
        expect(subject.content_status).to eq("drafted")
      end
    end
  end
end
