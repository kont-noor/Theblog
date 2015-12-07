module Theblog
  class PagePolicy < ApplicationPolicy
    def create?
      account_has_role?(user, [:editor, :moderator, :admin])
    end

    def update?
      user == record.author || account_has_role?(user, [:moderator, :admin])
    end
  end
end
