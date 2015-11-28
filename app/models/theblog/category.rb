module Theblog
  class Category < ContentNode
    has_many :posts, foreign_key: :parent_node_id

    validates_presence_of :title, :slug
    validates_uniqueness_of :slug, scope: :type
  end
end
