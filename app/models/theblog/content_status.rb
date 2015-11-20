module Theblog
  class ContentStatus < ActiveRecord::Base
    validates_presence_of :title
    validates_uniqueness_of :title
  end
end
