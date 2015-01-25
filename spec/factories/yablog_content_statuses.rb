FactoryGirl.define do
  factory :yablog_content_status, :class => 'Yablog::ContentStatus' do
    sequence(:title) { |n| "content_status_#{n}" }
    sequence(:description) { |n| "Content Status ##{n}" }
  end
end
