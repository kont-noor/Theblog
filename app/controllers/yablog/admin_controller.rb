module Yablog
  class AdminController < ApplicationController
    # TODO: temporary commented authentication
    #before_action :authenticate_user!
    def new
      @item = model.new
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
  end
end
