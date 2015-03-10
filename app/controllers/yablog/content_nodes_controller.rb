module Yablog
  class ContentNodesController < Yablog::ApplicationController
    skip_before_action :authenticate_user!, only: [:show]

    def show
      @node = ContentNode.by_parent(params[:category]).find_by!(slug: params[:slug])
    end
  end
end
