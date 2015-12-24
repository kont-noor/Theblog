module Theblog
  class ContentNodePolicy < ApplicationPolicy
    def create?
      user.has_roles?(:editor, :moderator, :admin)
    end

    def update?
      account_can_update_record?
    end

    def publish?
      account_can_update_record?
    end

    def draft?
      account_can_update_record?
    end

    def block?
      user.has_roles?(:moderator, :admin)
    end

    def unblock?
      user.has_roles?(:moderator, :admin)
    end

    def account_can_update_record?
      (user == record.author && user.has_roles?(:editor)) ||
          user.has_roles?(:moderator, :admin)
    end
  end
end
