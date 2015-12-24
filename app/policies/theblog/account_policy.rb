module Theblog
  class AccountPolicy < ApplicationPolicy
    def create?
      user.has_roles?(:admin)
    end

    def update?
      user.has_roles?(:admin)
    end

    def destroy?
      user.has_roles?(:admin)
    end
  end
end
