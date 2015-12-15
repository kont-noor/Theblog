require 'rails_helper'

describe 'admin posts' do
  let!(:account) { FactoryGirl.create(:editor) }
  let(:node_name) { :post }

  it_behaves_like :admin_content_node
end
