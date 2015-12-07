class CreateTheblogRoles < ActiveRecord::Migration
  def change
    create_table :theblog_roles do |t|
      t.string :name,       null: false, default: ""
      t.string :description

      t.timestamps null: false
    end
    add_index :theblog_roles, :name, unique: true
  end
end
