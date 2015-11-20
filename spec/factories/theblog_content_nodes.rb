FactoryGirl.define do
  factory :theblog_content_node, :class => 'Theblog::ContentNode' do
    title "MyString"
    slug "MyString"
    description "MyText"
    body "MyText"
    tags "MyString"
    content_status nil

    factory :category, class: 'Theblog::Category' do
    end
    factory :page, class: "Theblog::Page" do
    end
    factory :post, class: "Theblog::Post" do
    end
  end
end
