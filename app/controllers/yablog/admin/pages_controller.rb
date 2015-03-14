module Yablog
  class Admin::PagesController < AdminController
    MODEL = Yablog::Page
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
    INDEX = [:title, :description, :body]
  end
end
