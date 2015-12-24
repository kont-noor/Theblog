require 'rails_helper'

describe 'admin pages' do
  let!(:account) { FactoryGirl.create(:editor) }

  let(:node_name) { :page }

  it_behaves_like :admin_content_node
end
