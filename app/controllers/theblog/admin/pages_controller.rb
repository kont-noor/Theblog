module Theblog
  class Admin::PagesController < Admin::ItemsController
    MODEL = Theblog::Page
    ATTRIBUTES = [:title, :slug, :description, {body: :wysihtml5}, :tags]
    INDEX = [:title, :description, :body, :content_status]
  end
end
