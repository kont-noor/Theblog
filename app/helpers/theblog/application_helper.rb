module Theblog
  module ApplicationHelper
    def link_to_content_node(node)
      link = if node.parent_node.present?
                theblog.content_node_path(node.parent_node.slug, node.slug)
             else
                theblog.root_content_node_path(node.slug)
             end

      if block_given?
        link_to(link) { yield }
      else
        link_to node.title, link
      end
    end
  end
end
