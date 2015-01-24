module Yablog
  class Page < ContentNode
    validates_presence_of :body
  end
end
