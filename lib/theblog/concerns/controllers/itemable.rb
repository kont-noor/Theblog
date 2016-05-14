module Theblog
  module Itemable
    extend ActiveSupport::Concern

    included do
      before_action -> { authorize model, :"#{params[:action]}?"}, only: [:index, :new, :create]
      before_action -> { authorize item, :"#{params[:action]}?"}, only: [:show, :edit, :update]

      helper_method :item,
                    :items,
                    :model,
                    :model_params,
                    :model_associations,
                    :index_fields
    end

    # actions
    def new
      @item = model.new
    end

    def update
      if item.update(permitted_params)
        flash[:notice] = "Item updated"
        redirect_to action: :show
      else
        render 'new'
      end
    end

    #helpers
    private def model_associations
      self.class::ASSOCIATIONS
    rescue
      []
    end

    private def model_params
      self.class::ATTRIBUTES
    end

    private def model
      self.class::MODEL
    end

    private def item
      @item ||= if params.has_key?("#{model_params_key}_id")
                  model.find(params["#{model_params_key}_id"])
                else
                  model.find(params[:id])
                end
    end

    private def items
      @items ||= model.page params[:page]
    end

    private def model_association_param_keys
      model_associations.map do |association|
        reflection = model.reflections[association.to_s]
        key = reflection.foreign_key
        key = {key.pluralize => []} unless reflection.is_a? ActiveRecord::Reflection::BelongsToReflection
        key
      end
    end

    private def model_params_key
      model.to_s.underscore.match(/[\w_]+$/).to_s
    end

    private def index_fields
      self.class::INDEX
    end

    private def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys)
    end
  end
end
