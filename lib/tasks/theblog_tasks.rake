# desc "Explaining what the task does"
# task :theblog do
#   # Task goes here
# end
namespace :theblog do
  desc "Create blog account"
  task :create_account, [:name, :email, :password, :role] => :environment do |task, args|
    account_attributes = args.to_hash

    password = account_attributes[:password] || "password"

    account = Incarnator.account_model.constantize.
      create! email: account_attributes[:email],
              user_name: account_attributes[:name],
              password: password,
              confirmed_at: Time.now

    role = account_attributes[:role] || :admin
    Theblog::Role.find_by(name: role).accounts << account

    puts "account with username #{account.user_name} and email #{account.email} created " \
         "and added to #{role} group"
  end
end
