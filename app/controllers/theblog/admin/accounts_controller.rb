module Theblog
  class Admin::AccountsController < AdminController
    include Theblog::Itemable

    MODEL = Theblog::Account
    INDEX = [:user_name, :email, :first_name, :middle_name, :last_name, {roles: :name, link: true}]
    ATTRIBUTES = [:first_name, :middle_name, :last_name, :user_name, :email]
    ASSOCIATIONS = [:roles]

    def create
      authorize model, :create?
      @item = model.new(permitted_params)
      generated_password = Devise.friendly_token.first(8)
      @item.password = generated_password
      if @item.save
        # TODO: notify user
        flash[:notice] = "Item created"
        redirect_to action: :index
      else
        flash.now[:alert] = "Fix errors below"
        render 'new'
      end
    end

    def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys, role_ids: [])
    end
  end
end
