module Theblog
  class Account < Incarnator.account_model.constantize
    has_many :accounts_role
    has_many :roles, through: :accounts_role

    def has_roles?(*roles_to_check)
      accounts_role.joins(:role).where(theblog_roles: { name: roles_to_check }).exists?
    end
  end
end
