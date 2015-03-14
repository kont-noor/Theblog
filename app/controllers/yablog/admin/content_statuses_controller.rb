module Yablog
  class Admin::ContentStatusesController < AdminController
    MODEL = Yablog::ContentStatus
    ATTRIBUTES = [:title, :description]
    INDEX = [:title, :description]
  end
end
