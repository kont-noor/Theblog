require 'rails_helper'

module Theblog
  describe Admin::AccountsController, type: :controller do
    routes { Theblog::Engine.routes }

    let(:account) { FactoryGirl.create(:confirmed_account) }
    let(:created_account) { FactoryGirl.create(:theblog_account) }
    let(:params) do
      {
          user_name:   'John Doe',
          email:       'test@lk.lk',
          first_name:  'John',
          middle_name: 'Steven',
          last_name:   'Doe',
          role_ids:    Theblog::Role.where(name: [:editor, :moderator]).map(&:id)
      }
    end

    before { sign_in account }

    describe "POST create" do

      it "raises exception if user is not an admin" do
        expect{ post :create }.
            to raise_error(Pundit::NotAuthorizedError)
      end

      it "creates post if user has an admin role" do
        account.roles << Theblog::Role.find_by(name: :admin)
        post :create, account: params

        expect(response).to redirect_to(action: :index)

        account = Theblog::Account.last
        params.each_key do |attr|
          next if attr == :role_ids
          expect(account[attr]).to eq(params[attr])
        end

        expect(account.roles.map(&:name)).to eq(['moderator', 'editor'])
      end
    end

    describe "PATCH update" do
      before { created_account }

      it "raises exception if user is not an admin" do
        expect{ patch :update, id: created_account.id }.
            to raise_error(Pundit::NotAuthorizedError)
      end

      it "creates account if user has the admin role" do
        account.roles << Theblog::Role.find_by(name: :admin)
        patch :update, id: created_account.id, account: params

        expect(response).to redirect_to(action: :show)

        created_account.reload
        params.each_key do |attr|
          next if attr.in? [:role_ids, :email]
          expect(created_account[attr]).to eq(params[attr])
        end

        expect(created_account.roles.map(&:name)).to eq(['moderator', 'editor'])
      end
    end
  end
end
