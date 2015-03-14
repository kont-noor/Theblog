module Yablog
  class AdminController < ApplicationController
    # TODO: temporary commented authentication
    #before_action :authenticate_user!
    def new
      @item = model.new
    end

    def create
      if @item = model.create(permitted_params)
        flash[:notice] = "Item created"
        redirect_to action: :index
      else
        render 'new'
      end
    end

    def update
      if item.update(permitted_params)
        flash[:notice] = "Item updated"
        redirect_to action: :show
      else
        render 'new'
      end
    end

    private def item
      @item ||= model.find(params[:id])
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

    private def permitted_params
      params.require(model_params_key).permit(*model_params)
    end

    private def model_params_key
      model.to_s.match(/[\w_]+$/).to_s.downcase
    end

    private def index_fields
      self.class::INDEX
    end
    helper_method :index_fields
  end
end
