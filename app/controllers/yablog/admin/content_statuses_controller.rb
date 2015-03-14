module Yablog
  class Admin::ContentStatusesController < Admin::ItemsController
    MODEL = Yablog::ContentStatus
    ATTRIBUTES = [:title, :description]
    INDEX = [:title, :description]
  end
end
