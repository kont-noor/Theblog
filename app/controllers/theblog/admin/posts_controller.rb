module Theblog
  class Admin::PostsController < Admin::ItemsController
    MODEL = Theblog::Post
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
    INDEX = [:title, :description, :body, :category]
    ASSOCIATIONS = [:category]
  end
end
