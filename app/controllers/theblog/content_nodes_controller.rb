module Theblog
  class ContentNodesController < Theblog::ApplicationController
    skip_before_action :authenticate_user!, only: [:show]

    def show
      @node = Theblog::ContentNode.published.
        by_parent(params[:category]).
        find_by(slug: params[:slug])

      if @node.is_a? Theblog::Category
        @posts = @node.child_nodes.published.order("created_at DESC").page params[:page]
      end

      redirect_to theblog.root_path, notice: "Content not found" unless @node.present?
    end
  end
end
