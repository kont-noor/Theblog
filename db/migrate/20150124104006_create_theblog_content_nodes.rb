class CreateTheblogContentNodes < ActiveRecord::Migration
  def change
    create_table :theblog_content_nodes do |t|
      t.string :type,   null: false
      t.string :title,  null: false
      t.string :slug,   null: false
      t.text :description
      t.text :body
      t.string :tags
      t.references :content_status
      t.references :parent_node
      t.references :author

      t.timestamps
    end

    add_index :theblog_content_nodes, :author_id
    add_index :theblog_content_nodes, :type
    add_index :theblog_content_nodes, :title
    add_index :theblog_content_nodes, :slug
    add_index :theblog_content_nodes, [:type, :slug], unique: true

    add_foreign_key "theblog_content_nodes",
                    "theblog_content_statuses", column: :content_status_id
    add_foreign_key "theblog_content_nodes",
                    "theblog_content_nodes", column: :parent_node_id
  end
end
