module Theblog
  class Admin::ContentStatusesController < Admin::ItemsController
    MODEL = Theblog::ContentStatus
    ATTRIBUTES = [:title, :description]
    INDEX = [:title, :description]
  end
end
