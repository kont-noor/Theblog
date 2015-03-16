module Yablog
  class Admin::CategoriesController < Admin::ItemsController
    MODEL = Yablog::Category
    ATTRIBUTES = [:title, :slug, :description, :tags]
    INDEX = [:title, :description]
  end
end
