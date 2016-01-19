require 'rails_helper'

module Theblog
  RSpec.describe ContentNode, :type => :model do
    it { is_expected.to belong_to(:parent_node) }
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:child_nodes) }

    it { is_expected.to validate_presence_of(:content_status) }

    describe "#content_status" do
      it "initializes with drafted" do
        expect(subject.content_status).to eq("drafted")
      end

      context "aasm" do
        it { is_expected.to transition_from(:drafted).to(:published).on_event(:publish).on(:content_status) }
        it { is_expected.to transition_from(:published).to(:drafted).on_event(:draft).on(:content_status) }
        it { is_expected.to transition_from(:drafted).to(:blocked).on_event(:block).on(:content_status) }
        it { is_expected.to transition_from(:published).to(:blocked).on_event(:block).on(:content_status) }
        it { is_expected.to transition_from(:blocked).to(:drafted).on_event(:unblock).on(:content_status) }
      end
    end
  end
end
