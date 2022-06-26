# frozen_string_literal: true

RSpec.describe RadarSignal do
  describe "#rows" do
    it "returns signal rows" do
      signal = RadarSignal.new("oo\n--\n")
      expect(signal.rows).to eql([["o", "o"], ["-", "-"]])
    end
  end

  describe "#columns" do
    it "returns signal columns" do
      signal = RadarSignal.new("oo\n--\n")
      expect(signal.columns).to eql([["o", "-"], ["o", "-"]])
    end
  end

  describe "#size" do
    it "returns signal size" do
      signal = RadarSignal.new("oo\n--\n")
      expect(signal.size).to eql(4)
    end
  end
end
