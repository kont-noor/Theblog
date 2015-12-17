module Theblog
  class Category < ContentNode
    has_many :posts, foreign_key: :parent_node_id
  end
end
