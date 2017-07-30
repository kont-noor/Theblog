class CreateTheblogAccountsRoles < ActiveRecord::Migration
  def change
    create_table :theblog_accounts_roles do |t|
      t.references :account, null: false, index: true
      t.references :role,    null: false, index: true

      t.timestamps null: false
    end

    add_index :theblog_accounts_roles, [:account_id, :role_id], unique: true

    add_foreign_key :theblog_accounts_roles,
                    :theblog_roles, column: :role_id
    add_foreign_key :theblog_accounts_roles,
                    Theblog.account_model.constantize.table_name,
                    column: :account_id
  end
end
