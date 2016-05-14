module Theblog
  class Admin::AccountsController < AdminController
    def index
      authorize model, :index?
    end

    def new
      authorize model, :new?
      @item = model.new
    end

    def update
      authorize item, :update?
      if item.update(permitted_params)
        flash[:notice] = "Item updated"
        redirect_to action: :show
      else
        render 'new'
      end
    end

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

    private def item
      @item ||= if params.has_key?("#{model_params_key}_id")
                  model.find(params["#{model_params_key}_id"])
                else
                  model.find(params[:id])
                end
    end
    helper_method :item

    private def items
      @items ||= Theblog::Account.page params[:page]
    end
    helper_method :items

    private def index_fields
      [:user_name, :email, {roles: :name, link: true}]
    end
    helper_method :index_fields

    private def model_associations
      [:roles]
    end
    helper_method :model_associations

    private def model
      Theblog::Account
    end
    helper_method :model

    private def item
      @item ||= Theblog::Account.find(params[:id])
    end
    helper_method :item

    private def model_params
      [:user_name, :email]
    end
    helper_method :model_params

    def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys, role_ids: [])
    end

    private def model_association_param_keys
      model_associations.map do |association|
        model.reflections[association.to_s].foreign_key
      end
    end

    private def model_params_key
      model.to_s.underscore.match(/[\w_]+$/).to_s
    end
  end
end
