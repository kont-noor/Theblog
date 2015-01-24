module Yablog
  class ContentNode < ActiveRecord::Base
    belongs_to :content_status
    belongs_to :parent_node, class_name: 'Yablog::ContentNode'
    belongs_to :author, class_name: 'Yablog::User'

    validates_presence_of :title, :slug
  end
end
