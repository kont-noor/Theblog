class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @page = Page.find_by_slug('home')
    @page ||= Page.first
    render 'pages/show' if @page
  end
end
