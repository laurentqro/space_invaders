# frozen_string_literal: true
#
require "space_invaders/cli/display"
require "space_invaders/cli/formatting"

RSpec.describe Cli::Display do
  describe "#render_locations" do
    it "renders the list of suspected alien positions" do
      locations = [
        {
          accuracy: 0.9,
          difference_score: 8,
          position: { x: 1, y: 2},
          submatrix: [
            ["o", "-"],
            ["-", "o"],
          ]
        }
      ]

      expected_message = "\e[4m\e[35mLocation (1, 2)\e[0m\e[24m\nAccuracy: 0.9\nDifference Score: 8\n\nDetected:\n\n\e[31mo\e[0m\e[32m-\e[0m\n\e[32m-\e[0m\e[31mo\e[0m\n\n"

      expect{ Cli::Display.render_locations(locations) }.to output(expected_message).to_stdout
    end
  end
end
