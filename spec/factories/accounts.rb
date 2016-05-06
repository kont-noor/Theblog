FactoryGirl.define do
  factory :account, class: 'Theblog::Account' do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@fakemail.com" }
    password "qwertyui"

    factory :confirmed_account do
      confirmed_at Time.now

      Theblog::Role.all.each do |account_role|
        factory(account_role.name) do
          after(:create) do |account|
            account.roles << account_role
          end
        end
      end
    end
  end
end
