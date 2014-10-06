module Yablog
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    private def menu
      @menu ||= Page.all
    end
    helper_method :menu
  end
end
