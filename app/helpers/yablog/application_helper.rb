module Yablog
  module ApplicationHelper
    def link_to_content_node(node)
      link = if node.parent_node.present?
                yablog.content_node_path(node.parent_node.slug, node.slug)
             else
                yablog.root_content_node_path(node.slug)
             end

      link_to node.title, link
    end
  end
end
