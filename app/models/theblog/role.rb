module Theblog
  class Role < ActiveRecord::Base
    PREDEFINED = %i[admin moderator editor]

    has_many :accounts_roles
    has_many :accounts, through: :accounts_roles

    validates :name, presence: true, uniqueness: true
  end
end
