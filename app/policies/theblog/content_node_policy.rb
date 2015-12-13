module Theblog
  class ContentNodePolicy < ApplicationPolicy
    def create?
      account_has_role?(user, [:editor, :moderator, :admin])
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
      account_has_role?(user, [:moderator, :admin])
    end

    def unblock?
      account_has_role?(user, [:moderator, :admin])
    end

    def account_can_update_record?
      (user == record.author && account_has_role?(user, [:editor])) ||
        account_has_role?(user, [:moderator, :admin])
    end
  end
end
