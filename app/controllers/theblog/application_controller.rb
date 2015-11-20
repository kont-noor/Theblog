module Theblog
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private def menu
      @menu ||= Page.all
    end
    helper_method :menu
  end
end
