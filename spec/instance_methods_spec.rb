require 'spec_helper'
require 'ranking'

describe Ranking::InstanceMethods do
  before(:each) do
    @instance = Ranking[:foo, :bar]
  end

  describe "::new" do
    it "creates an empty scores hash" do
      Ranking.new.scores.should == {}
    end

    it "defaults to score=0" do
      Ranking[:foo].scores[:foo].should == 0
    end
  end

  describe "#inc" do
    it "returns self" do
      @instance.inc(:foo).should be_a(Ranking)
    end

    it "adds element if not already there" do
      @instance.inc(:baz).should include(:baz)
    end

    it "increments by passed value" do
      @instance.inc(:foo, 10).scores[:foo].should == 10
    end

    it "is idempotent" do
      @instance.inc(:foo, 5).inc(:foo, 5).scores[:foo].should == 10
    end

    it "defaults to 1" do
      @instance.inc(:foo).scores[:foo].should == 1
    end
  end

  describe "#dec" do
    it "returns self" do
      @instance.dec(:foo).should be_a(Ranking)
    end

    it "adds element if not already there" do
      @instance.dec(:baz).should include(:baz)
    end

    it "decrements by passed value" do
      @instance.dec(:foo, 10).scores[:foo].should == -10
    end

    it "is idempotent" do
      @instance.dec(:foo, 5).dec(:foo, 5).scores[:foo].should == -10
    end

    it "defaults to 1" do
      @instance.dec(:foo).scores[:foo].should == -1
    end
  end

  describe "#score" do
    it "returns self" do
      @instance.score(:foo, 10).should be_a(Ranking)
    end

    it "adds element if not already there" do
      @instance.score(:baz, 10).should include(:baz)
    end

    it "scorerements by passed value" do
      @instance.score(:foo, 10).scores[:foo].should == 10
    end

    it "is idempotent" do
      @instance.score(:foo, 5).score(:foo, 10).scores[:foo].should == 10
    end

    it "requires a value" do
      expect { @instance.score(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe "#[]" do
    before(:each) do
      @instance.score(:foo, 5).score(:bar, 4).score(:baz, 3).score(:qux,2)
    end

    it "indexes" do
      @instance[1].should == :bar
    end

    it "slices with .." do
      @instance[1..2].should == [:bar, :baz]
    end

    it "slices with ..." do
      @instance[1...3].should == [:bar, :baz]
    end
  end
end
