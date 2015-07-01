class RemoveAuthorFkFromContentNodes < ActiveRecord::Migration
  def change
    remove_foreign_key "yablog_content_nodes", column: :author_id
  end
end
