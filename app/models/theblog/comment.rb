module Theblog
  class Comment < ContentNode
    belongs_to :post, class_name: "Theblog::Post", foreign_key: :parent_node_id

    validates_presence_of :body
  end
end
