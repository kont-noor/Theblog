FactoryGirl.define do
  factory :theblog_comment, class: 'Theblog::Comment' do
    sequence(:body) { |n| "Comment ##{n} body" }
  end
end
