module Theblog
  class HomeController < Theblog::ApplicationController
    skip_before_action :authenticate_user!

    def index
      @node = Page.published.find_by(slug: 'home')
      @node ||= Page.published.first

      @posts = Post.published.page params[:page]
    end
  end
end
