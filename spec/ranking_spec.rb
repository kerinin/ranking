require 'spec_helper'
require 'ranking'

describe Ranking do
  it "should have a VERSION constant" do
    Ranking::VERSION.should_not be_empty
  end
end
