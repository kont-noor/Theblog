module Theblog
  class AccountPolicy < ApplicationPolicy
    def index?
      user.has_role?(:admin)
    end
  end
end
