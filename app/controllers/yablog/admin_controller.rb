module Yablog
  class AdminController < ApplicationController
    # TODO: temporary commented authentication
    #before_action :authenticate_user!

    layout "yablog/admin"
  end
end
