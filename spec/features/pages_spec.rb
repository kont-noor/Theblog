require 'rails_helper'

describe 'pages' do
  subject { FactoryGirl.create(:page) }

  it_behaves_like :frontend_content_node
end
