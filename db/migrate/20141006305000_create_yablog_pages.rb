class CreateYablogPages < ActiveRecord::Migration
  def change
    create_table :yablog_pages do |t|
      t.string :title,      null: false
      t.string :slug,       null: false
      t.text :description
      t.text :body,         null: false

      t.timestamps
    end
    add_index :yablog_pages, :slug, unique: true
  end
end
