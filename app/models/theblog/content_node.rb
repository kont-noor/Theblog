module Theblog
  class ContentNode < ActiveRecord::Base
    belongs_to :content_status
    belongs_to :parent_node, class_name: 'Theblog::ContentNode'
    belongs_to :author, class_name: Incarnator.account_model

    has_many :child_nodes, class_name: 'Theblog::ContentNode', foreign_key: :parent_node_id

    validates_presence_of :title, :slug
    validates_uniqueness_of :slug, scope: :type

    scope :by_parent, ->(parent_slug) do
      if parent_slug.present?
        joins('JOIN theblog_content_nodes AS parents ON theblog_content_nodes.parent_node_id = parents.id').
          where('parents.slug = ?', parent_slug)
      else
        where(parent_node_id: nil)
      end
    end
  end
end
