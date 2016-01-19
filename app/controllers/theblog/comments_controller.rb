module Theblog
  class CommentsController < Theblog::ApplicationController
    before_action :authenticate_account!

    def create
      @comment = node.comments.new(comment_params.merge(author_id: current_account.id))
      if @comment.save
        redirect_to path_to_content_node(node)
      else
        render 'content_nodes/show'
      end
    end

    def destroy
      authorize comment, :delete?
      comment.delete
      redirect_to path_to_content_node(comment.post)
    end

    private def node
      @node ||= Post.find_by!(id: comment_params[:parent_node_id])
    end

    private def comment_params
      params.require(:comment).permit(:body, :parent_node_id)
    end

    private def comment
      @comment ||= Comment.find(params[:id])
    end
    helper_method :comment
  end
end
