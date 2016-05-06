module Theblog
  class ContentNodePolicy < ApplicationPolicy
    def create?
      user.has_role?(:editor, :moderator, :admin)
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
      user.has_role?(:moderator, :admin)
    end

    def unblock?
      user.has_role?(:moderator, :admin)
    end

    def account_can_update_record?
      (user == record.author && user.has_role?(:editor)) ||
        user.has_role?(:moderator, :admin)
    end
  end
end
