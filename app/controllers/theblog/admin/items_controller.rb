module Theblog
  class Admin::ItemsController < AdminController

    before_action :update_content_status, only: [:draft, :publish, :block, :unblock]

    def new
      @item = model.new
    end

    def create
      authorize model, :create?
      if @item = model.create(permitted_params.merge({author: current_account}))
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
        render 'new'
      end
    end

    def draft; end

    def publish; end

    def block; end

    def unblock; end

    private def update_content_status
      state = params["action"]
      authorize item, :"#{state}?"

      item.send("#{state}!")
      redirect_to :back, notice: "Item is #{state}ed"
    rescue AASM::InvalidTransition => err
      redirect_to :back, alert: "Item is not #{state}ed"
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
      @items ||= model.all
    end
    helper_method :items

    private def model
      self.class::MODEL
    end
    helper_method :model

    private def model_params
      self.class::ATTRIBUTES
    end
    helper_method :model_params

    private def model_associations
      self.class::ASSOCIATIONS
    rescue
      []
    end
    helper_method :model_associations

    private def model_association_param_keys
      model_associations.map do |association|
        model.reflections[association.to_s].foreign_key
      end
    end

    private def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys)
    end

    private def model_params_key
      model.to_s.underscore.match(/[\w_]+$/).to_s
    end

    private def index_fields
      self.class::INDEX
    end
    helper_method :index_fields
  end
end
