class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :get_page, only: [:show, :edit, :update]

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to page_path(@page)
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render :edit
    end
  end

  private def get_page
    @page = if params[:slug].present?
              Page.find_by_slug(params[:slug])
            else
              Page.find(params[:id])
            end
    raise ActionController::RoutingError.new('Not Found') unless @page
  end

  private def page_params
    params.require(:page).permit(:title, :slug, :description, :body)
  end
end
