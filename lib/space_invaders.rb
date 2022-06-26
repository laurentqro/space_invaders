# frozen_string_literal: true

require_relative "space_invaders/version"
require_relative "space_invaders/radar_signal"

module SpaceInvaders
  class Error < StandardError; end

  def self.calculate_matrices_distance(invader, radar_signal)
    invader.rows.zip(radar_signal.rows).sum do |target_row, signal_row|
      self.hamming_distance(target_row, signal_row)
    end
  end

  def self.possible_locations(display, invader, radar_sample, accuracy)
    possible_locations = []

    (0..radar_sample.rows.length - invader.rows.length).each do |i|
      (0..radar_sample.columns.length - invader.columns.length).each do |j|
        submatrix = radar_sample.rows[i..i + (invader.rows.length - 1)]
          .transpose[j..j + invader.columns.length - 1]
          .transpose

        difference_score = self.calculate_matrices_distance(
          invader,
          RadarSignal.new(submatrix.map { |s| s.join }.join("\n") + "\n")
        )

        possible_location = {
          accuracy: (invader.size - difference_score).fdiv(invader.size).floor(2),
          difference_score: difference_score,
          position: { x: j, y: i },
          submatrix: submatrix,
        }

        possible_locations << possible_location
      end
    end

    display.render_locations(
      possible_locations
      .select { |location| location[:accuracy] >= accuracy }
      .sort { |location| location[:accuracy] }
    )
  end

  def self.hamming_distance(radar_signal_1, radar_signal_2)
    (0...radar_signal_1.length).count do |i|
      radar_signal_1[i] != radar_signal_2[i]
    end
  end
end
