class AddContentStatusToContentNode < ActiveRecord::Migration
  def change
    add_column :theblog_content_nodes, :content_status, :string, null: false, default: "published", index: true
  end
end
