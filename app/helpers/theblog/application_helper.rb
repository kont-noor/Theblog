module Theblog
  module ApplicationHelper
    def link_to_content_node(node)
      link = path_to_content_node(node)

      if block_given?
        link_to(link) { yield }
      else
        link_to node.title, link
      end
    end
  end
end
