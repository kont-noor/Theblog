module Theblog
  class CommentPolicy < ApplicationPolicy
    def update?
      user == record.author || user.has_role?(:moderator, :admin)
    end

    def delete?
      user == record.author || user.has_role?(:moderator, :admin)
    end
  end
end
