module Cli
  class Display

    def self.render_locations(locations)
      locations.each { |location| render_location(location) }
    end

    def self.render_location(location)
      puts "Location #{location[:position][:x]}, #{location[:position][:y]}".magenta.underline
      puts "Accuracy: #{location[:accuracy]}"
      puts "Difference Score: #{location[:difference_score]}"
      puts "Position: #{location[:position]}"

      blank_line

      render_matrix(location[:submatrix])

      blank_line
    end

    def self.render_matrix(matrix)
      puts "Detected:"
      blank_line

      matrix.map do |positions|
        render_positions(positions)
      end
    end

    def self.render_positions(positions)
      puts positions.map { |p| style_position(p) }.join
    end

    def self.style_position(position)
      if position == "-"
        position.green
      else
        position.red
      end
    end

    def self.blank_line
      puts "\n"
    end
  end
end
