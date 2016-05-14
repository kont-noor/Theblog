module Theblog
  class AccountPolicy < ApplicationPolicy
    def index?
      user.has_role?(:admin)
    end

    def new?
      user.has_role?(:admin)
    end

    def create?
      user.has_role?(:admin)
    end

    def update?
      user.has_role?(:admin)
    end
  end
end
