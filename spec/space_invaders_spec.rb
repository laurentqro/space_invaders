# frozen_string_literal: true

RSpec.describe SpaceInvaders do
  describe ".calculate_distance" do
    it "returns the Hamming distance between two arrays" do
      signal_1 = "ooo"
      signal_2 = "o-o"

      expect(SpaceInvaders.calculate_distance(signal_1, signal_2)).to eql(1)
    end
  end

  describe ".analyse" do
    it "returns the Hamming distance between two matrices" do
      radar_signal = <<~SIGNAL
        oo
        oo
      SIGNAL

      invader = <<~INVADER
        o-
        oo
      INVADER

      result = SpaceInvaders.analyse(RadarSignal.new(invader), RadarSignal.new(radar_signal))

      expect(result).to eql(2)
    end
  end
end
