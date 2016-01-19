class RemoveNotNullContrainsFromNodeSlug < ActiveRecord::Migration
  def change
    change_column :theblog_content_nodes, :slug, :string, null: true
    change_column :theblog_content_nodes, :title, :string, null: true
  end
end
