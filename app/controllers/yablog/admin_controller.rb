module Yablog
  class AdminController < ApplicationController
    # TODO: temporary commented authentication
    #before_action :authenticate_user!
    def index
      render text: "index"
    end

    def show
      render text: "show #{params[:id]}"
    end

    def new
      render text: "new"
    end

    def edit
      render text: "edit #{params[:id]}"
    end
  end
end
