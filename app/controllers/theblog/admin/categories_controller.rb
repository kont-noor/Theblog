module Theblog
  class Admin::CategoriesController < Admin::ItemsController
    MODEL = Theblog::Category
    ATTRIBUTES = [:title, :slug, :description, :tags]
    INDEX = [:title, :description, :content_status]
  end
end
