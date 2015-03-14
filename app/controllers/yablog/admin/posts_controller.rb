module Yablog
  class Admin::PostsController < AdminController
    MODEL = Yablog::Post
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
    INDEX = [:title, :description, :body, :category]
    ASSOCIATIONS = [:category]
  end
end
