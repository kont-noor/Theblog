module Theblog
  class Admin::AccountsController < AdminController
    def index
      authorize Theblog::Account, :index?
    end

    private def accounts
      @accounts ||= Theblog::Account.page params[:page]
    end
    alias_method :items, :accounts
    helper_method :items

    private def index_fields
      ['user_name', 'email', 'roles']
    end
    helper_method :index_fields

    private def model
      Theblog::Account
    end
    helper_method :model
  end
end
