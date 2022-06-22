# frozen_string_literal: true

require_relative "space_invaders/version"
require_relative "space_invaders/radar_signal"

module SpaceInvaders
  class Error < StandardError; end

  def self.calculate_distance(radar_signal_1, radar_signal_2)
    (0...radar_signal_1.length).count do |i|
      radar_signal_1.at_index(i) != radar_signal_2.at_index(i)
    end
  end
end
