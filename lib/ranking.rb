require 'set'

class Ranking < Set
  require 'ranking/instance_methods'
  require 'ranking/set_methods'

  include InstanceMethods
  include SetMethods

  attr_reader :scores
end

