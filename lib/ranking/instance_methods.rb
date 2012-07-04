module Ranking::InstanceMethods
  def initialize(*args)
    @scores = Hash.new(0)
    super *args
  end

  def inc(object, value=1)
    self << object
    scores[object] += value 
    self
  end

  def dec(object, value=1)
    self << object
    scores[object] -= value
    self
  end

  def score(object, value)
    self << object
    scores[object] = value
    self
  end

  def [](*args)
    to_a[*args]
  end
end
