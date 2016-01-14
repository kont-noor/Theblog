module Theblog
  class Admin::ItemsController < Admin::BaseItemsController

    before_action :update_content_status, only: [:draft, :publish, :block, :unblock]

    def create
      authorize model, :create?
      if @item = model.create(permitted_params.merge({author_id: current_account.id}))
        flash[:notice] = "Item created"
        redirect_to action: :index
      else
        render 'new'
      end
    end

    def update
      authorize item, :update?
      if item.update(permitted_params)
        flash[:notice] = "Item updated"
        redirect_to action: :show
      else
        render 'edit'
      end
    end

    def draft; end

    def publish; end

    def block; end

    def unblock; end

    private

    def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys)
    end

    def update_content_status
      state = params["action"]
      authorize item, :"#{state}?"

      item.send("#{state}!")
      redirect_to :back, notice: "Item is #{state}ed"
    rescue AASM::InvalidTransition => err
      redirect_to :back, alert: "Item is not #{state}ed"
    end

    def item
      @item ||= if params.has_key?("#{model_params_key}_id")
                  model.find(params["#{model_params_key}_id"])
                else
                  model.find(params[:id])
                end
    end
    helper_method :item
  end
end
