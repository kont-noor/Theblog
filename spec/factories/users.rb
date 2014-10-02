# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@fakemail.com" }
    password "qwertyui"
  end
end
