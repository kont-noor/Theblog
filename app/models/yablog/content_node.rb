module Yablog
  class ContentNode < ActiveRecord::Base
    belongs_to :content_status
    belongs_to :parent_node, class_name: 'Yablog::ContentNode'
    belongs_to :author, class_name: 'Incarnator::Account'

    has_many :child_nodes, class_name: 'Yablog::ContentNode', foreign_key: :parent_node_id

    validates_presence_of :title, :slug
    validates_uniqueness_of :slug, scope: :type

    scope :by_parent, ->(parent_slug) do
      if parent_slug.present?
        joins('JOIN yablog_content_nodes AS parents ON yablog_content_nodes.parent_node_id = parents.id').
          where('parents.slug = ?', parent_slug)
      else
        where(parent_node_id: nil)
      end
    end
  end
end
