FactoryGirl.define do
  factory :theblog_content_node, :class => 'Theblog::ContentNode' do
    sequence(:title) { |n| "Node ##{n} title" }
    sequence(:slug) { |n| "slug_#{n}" }
    sequence(:description) { |n| "Node ##{n} brief description" }
    body "MyText"
    tags "MyString"
    content_status "published"

    [:category, :page, :post].each do |subclass|
      factory subclass, class: "Theblog::#{subclass.capitalize}" do
        [:drafted, :published, :blocked].each do |status|
          factory "#{status}_#{subclass}" do
            content_status status
          end
        end
      end
    end
  end
end
