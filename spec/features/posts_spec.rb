require 'rails_helper'

describe 'posts' do
  subject { FactoryGirl.create(:post) }

  it_behaves_like :frontend_content_node
end
