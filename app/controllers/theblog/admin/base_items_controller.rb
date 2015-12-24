module Theblog
  class Admin::BaseItemsController < AdminController

    def new
      @item = model.new
    end

    protected

    def model
      self.class::MODEL
    end
    helper_method :model

    def model_params
      self.class::ATTRIBUTES
    end
    helper_method :model_params

    def model_associations
      self.class::ASSOCIATIONS
    rescue
      []
    end
    helper_method :model_associations

    def model_association_param_keys
      model_associations.map do |association|
        model.reflections[association.to_s].foreign_key
      end
    end

    def permitted_params
      params.require(model_params_key).permit(*model_params.map{ |attr| attr.is_a?(Hash) ? attr.keys.first : attr }, *model_association_param_keys)
    end

    def model_params_key
      model.to_s.underscore.match(/[\w_]+$/).to_s
    end

    def index_fields
      self.class::INDEX
    end
    helper_method :index_fields

    def items
      @items ||= model.page params[:page]
    end
    helper_method :items

    def item
      raise NotImplementedError
    end
    helper_method :item
  end
end
