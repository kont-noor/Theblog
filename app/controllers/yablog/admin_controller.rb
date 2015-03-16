module Yablog
  class AdminController < ApplicationController
    before_action :authenticate_user!

    layout "yablog/admin"
  end
end
