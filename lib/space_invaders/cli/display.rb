module Cli
  class Display

    def self.render_locations(locations)
      locations.each { |location| render_location(location) }
    end

    def self.render_location(location)
      puts "Location (#{location[:position][:x]}, #{location[:position][:y]})".magenta.underline
      puts "Accuracy: #{location[:accuracy]}"
      puts "Difference Score: #{location[:difference_score]}"

      render_blank_line

      render_invader(location[:submatrix])

      render_blank_line
    end

    def self.render_invader(matrix)
      puts "Detected:"
      render_blank_line

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

    def self.render_blank_line
      puts "\n"
    end

    private_class_method :render_invader, :render_positions, :style_position, :render_blank_line
  end
end
