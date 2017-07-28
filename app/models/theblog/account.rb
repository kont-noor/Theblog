module Theblog
  class Account < Theblog.account_model.constantize
    has_many :content_nodes

    has_many :accounts_roles
    has_many :roles, through: :accounts_roles

    def has_role?(*roles_to_check)
      accounts_roles.joins(:role).where(theblog_roles: { name: roles_to_check }).exists?
    end
  end
end
