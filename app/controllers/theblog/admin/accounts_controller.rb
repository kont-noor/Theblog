module Theblog
  class Admin::AccountsController < Admin::BaseItemsController
    MODEL = Theblog::Account
    ATTRIBUTES = %i[user_name first_name middle_name last_name email password password_confirmation].freeze
    INDEX = %i[user_name first_name middle_name last_name email roles].freeze

    before_action :find_account, only: %i[edit update destroy]

    def new
      @account = model.new
    end

    def create
      authorize model, :create?

      if @account = model.create(permitted_params.merge(confirmed_at: Time.now))
        flash[:notice] = "Account created"
        redirect_to action: :index
      else
        render 'new'
      end
    end

    def update
      authorize @account, :update?

      @account.skip_reconfirmation!
      if (permitted_params[:password].blank? ?
          @account.update_without_password(permitted_params) : @account.update(permitted_params))
        flash[:notice] = "Account updated"
        redirect_to action: :index
      else
        render 'edit'
      end
    end

    def destroy
      authorize model, :destroy?

      item.destroy
      flash[:notice] = "Account destroyed"

      redirect_to action: :index
    end

    private

    def permitted_params
      params.require(model_params_key).permit(*(ATTRIBUTES+[{role_ids: []}]))
    end

    def find_account
      @account = model.find(params[:id])
    end

    def item
      @account ||= find_account
    end
  end
end
