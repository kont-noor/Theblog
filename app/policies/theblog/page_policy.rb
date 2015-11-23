module Theblog
  class PagePolicy < ApplicationPolicy
    def update?
      user == record.author
    end
  end
end
