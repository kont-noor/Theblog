module Yablog
  class Admin::PostsController < Admin::ItemsController
    MODEL = Yablog::Post
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
    INDEX = [:title, :description, :body, :category]
    ASSOCIATIONS = [:category]
  end
end
