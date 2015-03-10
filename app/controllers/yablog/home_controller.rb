module Yablog
  class HomeController < Yablog::ApplicationController
    skip_before_action :authenticate_user!

    def index
      @node = Page.find_by_slug('home')
      @node ||= Page.first
      render 'yablog/content_nodes/show' if @node
    end
  end
end
