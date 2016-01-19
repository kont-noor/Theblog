module Theblog
  class Page < ContentNode
    validates_presence_of :title, :slug, :body
    validates_uniqueness_of :slug, scope: :type
  end
end
