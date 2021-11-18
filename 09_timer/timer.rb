class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    "#{time_by_int("%H")}:#{time_by_int("%M")}:#{time_by_int("%S")}"
  end

  def padded(num)
    sprintf("%02d", num)
  end

  private

  def time_by_int(format)
    Time.at(@seconds).utc.strftime(format)
  end
end
