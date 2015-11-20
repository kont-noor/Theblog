module Theblog
  class Category < ContentNode
    has_many :posts, foreign_key: "parend_node_id"
  end
end
