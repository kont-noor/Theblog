module Yablog
  class Post < ContentNode
    validates_presence_of :body
  end
end
