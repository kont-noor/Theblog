FactoryGirl.define do
  factory :yablog_content_node, :class => 'Yablog::ContentNode' do
    title "MyString"
    slug "MyString"
    description "MyText"
    body "MyText"
    tags "MyString"
    content_status nil

    factory :category, class: 'Yablog::Category' do
    end
    factory :page, class: "Yablog::Page" do
    end
    factory :post, class: "Yablog::Post" do
    end
  end
end
