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
  end
end
