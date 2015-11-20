FactoryGirl.define do
  factory :account, class: Incarnator.account_model do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@fakemail.com" }
    password "qwertyui"

    factory :confirmed_account do
      confirmed_at Time.now
    end
  end
end
