module Theblog
  class Admin::ItemsController < AdminController
    include Theblog::Itemable

    before_action :update_content_status, only: [:draft, :publish, :block, :unblock]

    def create
      @item = model.new(permitted_params.merge({author_id: current_account.id}))
      if @item.save
        flash[:notice] = "Item created"
        redirect_to action: :index
      else
        render 'new'
      end
    end

    def draft; end

    def publish; end

    def block; end

    def unblock; end

    private def update_content_status
      state = params["action"]
      authorize item, :"#{state}?"

      item.send("#{state}!")
      redirect_back notice: "Item is #{state}ed", fallback_location: theblog.admin_root_path
    rescue AASM::InvalidTransition => err
      redirect_back alert: "Item is not #{state}ed", fallback_location: theblog.admin_root_path
    end
  end
end
