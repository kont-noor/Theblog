module Theblog
  class Page < ContentNode
    validates_presence_of :body
  end
end
