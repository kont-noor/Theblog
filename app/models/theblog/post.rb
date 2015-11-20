module Theblog
  class Post < ContentNode
    belongs_to :category, class_name: "Theblog::Category", foreign_key: :parent_node_id
    validates_presence_of :body
  end
end
