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

  describe ".submatrices" do
    it "returns a list of target-sized sub-matrices for the given radar sample" do
      radar_sample = <<~RADAR
        123
        456
        789
      RADAR

      invader = <<~TARGET
        --
        --
      TARGET

      expected = [
        [
          ["1", "2"],
          ["4", "5"]
        ],
        [
          ["2", "3"],
          ["5", "6"]
        ],
        [
          ["4", "5"],
          ["7", "8"]
        ],
        [
          ["5", "6"],
          ["8", "9"]
        ]
      ]

      submatrices = SpaceInvaders.submatrices(
        RadarSignal.new(invader),
        RadarSignal.new(radar_sample)
      )

      expect(submatrices).to eql(expected)
    end
  end
end
