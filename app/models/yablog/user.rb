module Yablog
  class User < ActiveRecord::Base
    validates :email, :user_name, presence: true, uniqueness: true
  end
end
