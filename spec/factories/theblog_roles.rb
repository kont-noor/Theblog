FactoryGirl.define do
  factory :theblog_role, :class => 'Theblog::Role' do
    sequence(:name) { |n| "role_#{n}" }
    sequence(:description) { |n| "Role #{n} description" }
  end
end
