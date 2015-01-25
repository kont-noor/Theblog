FactoryGirl.define do
  factory :yablog_content_node, :class => 'Yablog::ContentNode' do
    type ""
    title "MyString"
    slug "MyString"
    description "MyText"
    body "MyText"
    tags "MyString"
    content_status nil
  end
end
