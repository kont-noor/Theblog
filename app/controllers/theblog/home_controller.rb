module Theblog
  class HomeController < Theblog::ApplicationController
    skip_before_action :authenticate_user!

    def index
      @node = Page.find_by(slug: 'home')
      @node ||= Page.first

      @posts = Post.all
    end
  end
end
