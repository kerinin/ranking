module Ranking::SetMethods
  def &(enum)
    raise NotImplementedError
  end

  def |(enum)
    dup.merge(enum)
  end

  def -(enum)
    raise NotImplementedError
  end

  def ==(other)
    other.kind_of?(Ranking) and other.scores == scores and super(other)
  end

  def ^(other)
    raise NotImplementedError
  end

  def clear
    @scores = Hash.new(0)
    super
  end

  def collect
    raise NotImplementedError
  end

  def delete(object)
    scores.delete(object)
    super object
  end

  def delete?(object)
    scores.delete(object)
    super object
  end

  def delete_if(&block)
    raise NotImplementedError
  end

  def divide(&block)
    raise NotImplementedError
  end

  def each(&block)
    to_a.each(&block)
  end

  def flatten
    raise NotImplementedError
  end

  def inspect
    "<Ranking: #{to_a.map(&:inspect).join(', ')}>"
  end

  def keep_if(&block)
    raise NotImplementedError
  end

  def merge(enum)
    if enum.kind_of?(Ranking)
      scores.merge!(enum.scores)
    end

    super enum
  end

  def reject!(&block)
    raise NotImplementedError
  end

  def replace(enum)
    raise NotImplementedError
  end

  def select!(&block)
    raise NotImplementedError
  end

  def to_a
    super.sort do |a,b|
      if scores[a] == scores[b]
        a <=> b
      else
        scores[b] <=> scores[a]
      end
    end
  end
end
