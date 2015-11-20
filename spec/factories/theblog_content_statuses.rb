FactoryGirl.define do
  factory :theblog_content_status, :class => 'Theblog::ContentStatus' do
    sequence(:title) { |n| "content_status_#{n}" }
    sequence(:description) { |n| "Content Status ##{n}" }
  end
end
