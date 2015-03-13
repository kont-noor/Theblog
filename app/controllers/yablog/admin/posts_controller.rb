module Yablog
  class Admin::PostsController < AdminController
    MODEL = Yablog::Post
    ATTRIBUTES = [:title, :slug, :description, :body, :tags]
  end
end
