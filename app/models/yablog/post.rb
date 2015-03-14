module Yablog
  class Post < ContentNode
    belongs_to :category, class_name: "Yablog::Category", foreign_key: :parent_node_id
    validates_presence_of :body
  end
end
