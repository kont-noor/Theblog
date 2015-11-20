module Theblog
  class AdminController < ApplicationController
    before_action :authenticate_account!

    layout "theblog/admin"
  end
end
