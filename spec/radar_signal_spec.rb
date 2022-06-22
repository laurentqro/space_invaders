# frozen_string_literal: true

RSpec.describe RadarSignal do
  describe "#at_index" do
    it "returns symbol at index" do
      signal = RadarSignal.new("o-o")
      expect(signal.at_index(1)).to eql("-")
    end
  end

  describe "#length" do
    it "returns symbol count of signal" do
      signal = RadarSignal.new("o-o")
      expect(signal.length).to eql(3)
    end
  end
end
