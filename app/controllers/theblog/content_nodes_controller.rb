module Theblog
  class ContentNodesController < Theblog::ApplicationController
    def show
      @node = Theblog::ContentNode.published.
        by_parent(params[:category]).
        find_by(slug: params[:slug])

      if @node.is_a? Theblog::Category
        @posts = @node.child_nodes.published.order("created_at DESC").page params[:page]
      end

      redirect_to theblog.root_path, notice: "Content not found" unless @node.present?
    end

    private def comment
      @node.comments.new
    end
    helper_method :comment
  end
end
