module Yablog
  class Admin::PagesController < Admin::ItemsController
    MODEL = Yablog::Page
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
    INDEX = [:title, :description, :body]
  end
end
