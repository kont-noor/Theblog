module Theblog
  class Admin::AccountsController < AdminController
    def index
      authorize Theblog::Account, :index?
    end

    def new
      @item = model.new
    end

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
  end
end
