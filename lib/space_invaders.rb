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

  def self.submatrices(invader, radar_sample)
    submatrices = []

    (0..radar_sample.rows.length - invader.rows.length).each do |i|
      (0..radar_sample.columns.length - invader.columns.length).each do |j|
        submatrix = radar_sample.rows[i..i + (invader.rows.length - 1)]
          .transpose[j..j + invader.columns.length - 1]
          .transpose

        submatrices << submatrix
      end
    end

    submatrices
  end
end
