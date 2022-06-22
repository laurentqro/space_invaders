class RadarSignal
  attr_reader :signal

  def initialize(signal)
    @signal = signal
  end

  def at_index(index)
    signal[index]
  end

  def length
    signal.length
  end
end
