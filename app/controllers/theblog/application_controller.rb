module Theblog
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    private def menu
      @menu ||= Page.published
    end
    helper_method :menu

    # TODO: get current account helper name from Incarnator
    # The commented line below didn't work for overrode controllers
    # alias_method :current_user, :current_account
    def current_user
      current_account
    end

    def path_to_content_node(node)
      if node.parent_node.present?
        theblog.content_node_path(node.parent_node.slug, node.slug)
      else
        theblog.root_content_node_path(node.slug)
      end
    end
    helper_method :path_to_content_node
  end
end
