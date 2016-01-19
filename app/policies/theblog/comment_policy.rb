module Theblog
  class CommentPolicy < ApplicationPolicy
    def update?
      user == record.author || account_has_role?(user, [:moderator, :admin])
    end

    def delete?
      user == record.author || account_has_role?(user, [:moderator, :admin])
    end
  end
end
