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
      expect {@instance - @instance}.to raise_error(NotImplementedError)
    end
  end

  describe "#==" do
  end

  describe "#^" do
  end

  describe "#add" do
  end

  describe "#add?" do
  end

  describe "#clear" do
  end

  describe "#collect" do
  end

  describe "#delete" do
  end

  describe "#delete?" do
  end

  describe "#delete_if" do
  end

  describe "#divide" do
  end

  describe "#each" do
  end

  describe "#flatten" do
  end

  describe "#initialize_copy" do
  end

  describe "#inspect" do
  end

  describe "#keep_if" do
  end

  describe "#merge" do
  end

  describe "#reject!" do
  end

  describe "#replace" do
  end

  describe "#select!" do
  end

  describe "#subtract" do
  end

  describe "#to_a" do
  end
end
