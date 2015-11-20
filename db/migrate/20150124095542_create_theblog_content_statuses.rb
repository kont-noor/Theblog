class CreateTheblogContentStatuses < ActiveRecord::Migration
  def change
    create_table :theblog_content_statuses do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
    add_index :theblog_content_statuses, :title, unique: true
  end
end
