require 'set'

class Ranking < Set
  VERSION = "0.0.0"

  require 'ranking/instance_methods'
  require 'ranking/set_methods'

  include InstanceMethods
  include SetMethods

  attr_reader :scores
end

