module Yablog
  class AdminController < ApplicationController
    before_action :authenticate_account!

    layout "yablog/admin"
  end
end
