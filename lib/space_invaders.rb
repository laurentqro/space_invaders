# frozen_string_literal: true

require_relative "space_invaders/version"
require_relative "space_invaders/radar_signal"

module SpaceInvaders
  class Error < StandardError; end

  def self.analyse(invader, radar_signal)
    rows_distance = invader.rows.zip(radar_signal.rows).sum do |target_row, signal_row|
      self.calculate_distance(target_row, signal_row)
    end

    columns_distance = invader.columns.zip(radar_signal.columns).sum do |target_col, signal_col|
      self.calculate_distance(target_col, signal_col)
    end

    rows_distance + columns_distance
  end

  def self.calculate_distance(radar_signal_1, radar_signal_2)
    (0...radar_signal_1.length).count do |i|
      radar_signal_1[i] != radar_signal_2[i]
    end
  end
end
