FactoryGirl.define do
  factory :user, class: 'Yablog::User' do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@fakemail.com" }
    encrypted_password "qwertyui"

    factory :confirmed_user do
      confirmed_at Time.now
    end
  end
end
