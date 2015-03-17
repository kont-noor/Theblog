module Yablog
  class HomeController < Yablog::ApplicationController
    skip_before_action :authenticate_user!

    def index
      @node = Page.find_by(slug: 'home')
      @node ||= Page.first

      @posts = Post.all
    end
  end
end
