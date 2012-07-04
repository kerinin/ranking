require 'set'

require 'ranking/instance_methods'
require 'ranking/set_methods'

class Ranking
  include InstanceMethods
  include SetMethods

  attr_reader :scores
end
