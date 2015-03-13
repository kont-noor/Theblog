module Yablog
  class Admin::CategoriesController < AdminController
    MODEL = Yablog::Category
    ATTRIBUTES = [:title, :slug, :description, :tags]
  end
end
