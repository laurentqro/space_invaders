# frozen_string_literal: true

RSpec.describe SpaceInvaders do
  describe ".calculate_distance" do
    it "returns the Hamming distance between two signals" do
      signal_1 = RadarSignal.new("ooo")
      signal_2 = RadarSignal.new("o-o")

      expect(SpaceInvaders.calculate_distance(signal_1, signal_2)).to eql(1)
    end
  end
end
