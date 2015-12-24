module Theblog
  class ContentNode < ActiveRecord::Base
    include AASM

    belongs_to :parent_node, class_name: 'Theblog::ContentNode'
    belongs_to :author, class_name: 'Theblog::Account'

    has_many :child_nodes, class_name: 'Theblog::ContentNode', foreign_key: :parent_node_id

    validates_presence_of :title, :slug, :content_status
    validates_uniqueness_of :slug, scope: :type

    scope :by_parent, ->(parent_slug) do
      if parent_slug.present?
        joins('JOIN theblog_content_nodes AS parents ON theblog_content_nodes.parent_node_id = parents.id').
          where(parents: {slug: parent_slug})
      else
        where(parent_node_id: nil)
      end
    end

    aasm :content_status do
      state :drafted, initial: true
      state :published
      state :blocked

      event :publish do
        transitions from: :drafted, to: :published
      end

      event :draft do
        transitions from: :published, to: :drafted
      end

      event :block do
        transitions from: [:published, :drafted], to: :blocked
      end

      event :unblock do
        transitions from: :blocked, to: :drafted
      end
    end
  end
end
