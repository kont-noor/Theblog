require "rails_helper"

RSpec.describe "theblog:create_account", type: :rake do
  let(:task_name) { "theblog:create_account" }
  let(:account_model) { Incarnator.account_model.constantize }


  it "creates account" do
    expect(subject).to be_a(Rake::Task)
    expect(subject.name).to eq(task_name)
    expect(subject).to eq(task)

    expect { subject.execute({name: :admin, email: "admin@theblog.com"}) }.to change(account_model, :count).from(0).to(1)
    account = account_model.last
    expect(account.user_name).to eq("admin")
    expect(account.email).to eq("admin@theblog.com")
    expect(Theblog::Role.find_by(name: :admin).accounts).to include(account)
  end
end
