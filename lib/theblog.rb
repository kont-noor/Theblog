require "haml"
require "simple_form"
require "theblog/engine"

module Theblog
  mattr_accessor :account_model
  @@account_model = nil

  def self.setup
    yield self
  end
end
