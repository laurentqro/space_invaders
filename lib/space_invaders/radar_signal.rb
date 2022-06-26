class RadarSignal
  attr_reader :signal

  def initialize(signal)
    @signal = signal
  end

  def columns
    rows.transpose
  end

  def rows
    signal.split("\n").map(&:chars)
  end

  def size
    signal.gsub("\n", "").size
  end
end
