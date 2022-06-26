# frozen_string_literal: true

RSpec.describe SpaceInvaders do
  describe ".calculate_matrices_distance" do
    it "returns the Hamming distance between two matrices" do
      radar_signal = <<~SIGNAL
        oo
        oo
      SIGNAL

      invader = <<~INVADER
        o-
        oo
      INVADER

      result = SpaceInvaders.calculate_matrices_distance(RadarSignal.new(invader), RadarSignal.new(radar_signal))

      expect(result).to eql(1)
    end
  end

  describe ".possible_locations" do
    it "returns a list of target-sized sub-matrices for the given radar sample" do
      radar_sample = <<~RADAR
        ------
        --oo--
        --oo--
        ------
      RADAR

      invader = <<~TARGET
        oo
        oo
      TARGET

      expected = [
        {
          accuracy: 1.0,
          difference_score: 0,
          position: { x: 2, y: 1 },
          submatrix: [["o", "o"], ["o", "o"]]
        }
      ]

      possible_locations = SpaceInvaders.possible_locations(
        RadarSignal.new(invader),
        RadarSignal.new(radar_sample),
        0.75
      )

      expect(possible_locations).to eql(expected)
    end
  end
end
