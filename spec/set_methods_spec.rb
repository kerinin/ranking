require 'spec_helper'
require 'ranking'

describe Ranking::SetMethods do
  before(:each) do
    @instance = Ranking.new
  end

  describe "#&" do
  end

  describe "#|" do
  end

  describe "#-" do
    it "isn't implemented" do
      expect { @instance - @instance }.to raise_error(NotImplementedError)
    end
  end

  describe "#==" do
  end

  describe "#^" do
    it "isn't implemented" do
      expect { @instance ^ @instance }.to raise_error(NotImplementedError)
    end
  end

  describe "#add" do
  end

  describe "#add?" do
  end

  describe "#clear" do
  end

  describe "#collect" do
    it "isn't implemented" do
      expect { @instance.collect {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#delete" do
  end

  describe "#delete?" do
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
  end

  describe "#flatten" do
    it "isn't implemented" do
      expect { @instance.flatten }.to raise_error(NotImplementedError)
    end
  end

  describe "#inspect" do
  end

  describe "#keep_if" do
    it "isn't implemented" do
      expect { @instance.keep_if {} }.to raise_error(NotImplementedError)
    end
  end

  describe "#merge" do
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

  describe "#subtract" do
  end

  describe "#to_a" do
  end
end
