module Theblog
  class Post < ContentNode
    belongs_to :category, class_name: 'Theblog::Category', foreign_key: :parent_node_id

    validates_presence_of :title, :slug, :body
    validates_uniqueness_of :slug, scope: :type

    has_many :comments, class_name: 'Theblog::Comment', foreign_key: :parent_node_id
  end
end
