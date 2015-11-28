module Theblog
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    private def menu
      @menu ||= Page.all
    end
    helper_method :menu

    # TODO: get current account helper name from Incarnator
    alias_method :current_user, :current_account

    def account_has_role?(account, role)
      Theblog::AccountsRole.includes(:role).exists?(account: account, theblog_roles: { name: role})
    end
    helper_method :account_has_role?
  end
end
