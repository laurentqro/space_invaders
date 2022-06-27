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

      expected_message = <<~EXPECTED

        \e[4m\e[35mPossible invader detected at location: (1, 2)\e[0m\e[24m
        Accuracy: 0.9
        Difference Score: 8

        \e[31mo\e[0m\e[32m-\e[0m
        \e[32m-\e[0m\e[31mo\e[0m
      EXPECTED

      expect{ Cli::Display.render_locations(locations) }.to output(expected_message).to_stdout
    end
  end
end
