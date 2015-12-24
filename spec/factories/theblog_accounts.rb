FactoryGirl.define do
  factory :account, class: Theblog::Account do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@fakemail.com" }
    password "qwertyui"

    factory :confirmed_account do
      confirmed_at Time.now

      Theblog::Role::PREDEFINED.each do |role|
        factory(role) do
          after(:create) do |account|
            Theblog::Role.find_by(name: role).accounts << account
          end
        end
      end
    end
  end
end
