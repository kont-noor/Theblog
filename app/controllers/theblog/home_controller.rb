module Theblog
  class HomeController < Theblog::ApplicationController
    def index
      @node = Page.published.find_by(slug: 'home')
      @node ||= Page.published.first

      @posts = Post.published.order(created_at: :desc).page params[:page]
    end
  end
end
