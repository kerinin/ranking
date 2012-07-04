require 'spec_helper'
require 'ranking'

describe Ranking::SetMethods do
  before(:each) do
    @instance = Ranking[:foo, :bar]
  end

  describe "#&" do
    it "isn't implemented" do
      expect { @instance & @instance }.to raise_error(NotImplementedError)
    end
  end

  describe "#|" do
    before(:each) do
      other = Ranking[:bar, :baz].inc(:bar).inc(:baz)
      @union = @instance | other
    end

    it "creates the union set" do
      @union.to_set.should == [:foo, :bar, :baz].to_set
    end

    it "merges scores with preference to other" do
      @union.scores.should == {:bar => 1, :baz => 1}
    end
  end

  describe "#-" do
    it "isn't implemented" do
      expect { @instance - @instance }.to raise_error(NotImplementedError)
    end
  end

  describe "#==" do
    it "is true if the same" do
      @instance.should == @instance
    end

    it "is false if scores different" do
      other = Ranking[@instance.to_a].dec(:foo)
      @instance.should_not == @other
    end

    it "is false if sets different" do
      other = Ranking[:bar, :baz]
      other.instance_variable_set(:@scores, @instance.scores)
      @instance.should_not == other
    end
  end

  describe "#^" do
    it "isn't implemented" do
      expect { @instance ^ @instance }.to raise_error(NotImplementedError)
    end
  end

  describe "#add" do
    before(:each) do
      @instance.add :baz
    end

    it "returns self" do
      @instance.add(:qux).should be_a(Ranking)
    end

    it "adds to the set" do
      @instance.should include(:baz)
    end
  end

  describe "#add?" do
    it "calls add" do
      @instance.should_receive(:add).with(:baz)
      @instance.add?(:baz)
    end

    it "returns nil if already a member" do
      @instance.add?(:foo).should be_false
    end
  end

  describe "#clear" do
    before(:each) do
      @instance.clear
    end

    it "removes set elements" do
      @instance.to_set.should == Set.new
    end

    it "clears scores" do
      @instance.scores.should == {}
    end
  end

  describe "#collect" do
    it "isn't implemented" do
      expect { @instance.collect {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#delete" do
    before(:each) do
      @instance.delete(:foo)
    end

    it "removes from set" do
      @instance.should_not include(:foo)
    end

    it "removes from scores" do
      @instance.scores.keys.should_not include(:foo)
    end
  end

  describe "#delete?" do
    it "removes from the set" do
      @instance.delete?(:foo).should_not include(:foo)
    end

    it "removes from the scores" do
      @instance.delete?(:foo).scores.keys.should_not include(:foo)
    end

    it "returns nil if not a member" do
      @instance.delete?(:baz).should be_false
    end
  end

  describe "#delete_if" do
    it "isn't implemented" do
      expect { @instance.delete_if {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#divide" do
    it "isn't implemented" do
      expect { @instance.divide {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#each" do
    it "yields in order" do
      @instance.score(:foo, 5)
      @instance.score(:bar, 0)
      @instance.score(:baz, 3)

      yielder = double
      yielder.should_receive(:call).with(:foo).ordered
      yielder.should_receive(:call).with(:baz).ordered
      yielder.should_receive(:call).with(:bar).ordered

      @instance.each {|i| yielder.call(i)}
    end
  end

  describe "#flatten" do
    it "isn't implemented" do
      expect { @instance.flatten }.to raise_error(NotImplementedError)
    end
  end

  describe "#inspect" do
    it "returns string" do
      @instance.inc(:baz)
      @instance.inspect.should == "<Ranking: :baz, :bar, :foo>"
    end
  end

  describe "#keep_if" do
    it "isn't implemented" do
      expect { @instance.keep_if {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#merge" do
    it "adds to set" do
      @instance.merge Ranking[:baz]
      @instance.should include(:baz)
    end

    it "adds to scores" do
      @instance.merge Ranking[:baz].score(:baz,10)
      @instance.scores[:baz].should == 10
    end

    it "merges scores with preference to other" do
      @instance.merge Ranking[:bar].score(:bar,10)
      @instance.scores[:bar].should == 10
    end

    it "accepts enumerable" do
      @instance.merge [:bar, :baz]
      @instance.should include(:baz)
    end

    it "retains existing scores if enumerable part of set" do
      @instance.score(:bar, 10).merge [:bar, :baz]
      @instance.scores[:bar].should == 10
    end

    it "defaults to zero if enumerable not part of set" do
      @instance.merge [:bar, :baz]
      @instance.scores[:baz].should == 0
    end
  end

  describe "#reject!" do
    it "isn't implemented" do
      expect { @instance.reject! {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#replace" do
    it "isn't implemented" do
      expect { @instance.replace @replace }.to raise_error(NotImplementedError)
    end
  end

  describe "#select!" do
    it "isn't implemented" do
      expect { @instance.select! {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#to_a" do
    it "returns an array" do
      @instance.to_a.should be_a(Array)
    end

    it "sorts by score" do
      @instance.score(:foo, 5)
      @instance.score(:bar, 0)
      @instance.score(:baz, 3)

      @instance.to_a.should == [:foo, :baz, :bar]
    end

    it "sorts by value if score equivalent" do
      @instance.score(:foo, 5)
      @instance.score(:bar, 0)
      @instance.score(:qux, 2)
      @instance.score(:baz, 2)

      @instance.to_a.should == [:foo, :baz, :qux, :bar]
    end
  end
end
