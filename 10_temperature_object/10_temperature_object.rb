require 'bigdecimal/util'

class Temperature
  attr_accessor :celsius, :fahrenheit

  def initialize(celsius:false, fahrenheit:false)
    @celsius = celsius
    @fahrenheit = fahrenheit
  end

  def self.from_celsius(from_celsius)
    Temperature.new(celsius: from_celsius)
  end

  def self.from_fahrenheit(from_fahrenheit)
    Temperature.new(fahrenheit: from_fahrenheit)
  end

  def self.fahrenheit_to_celsius(from_fahrenheit)
    5.0 / 9.0 * (from_fahrenheit - 32.0)
  end

  def self.celsius_to_fahrenheit(from_celsius)
    (9.0 / 5.0 * from_celsius.to_d + 32).to_f
  end

  def in_celsius
    !@fahrenheit ? @celsius : Temperature.fahrenheit_to_celsius(@fahrenheit)
  end

  def in_fahrenheit
    !@celsius ? @fahrenheit : Temperature.celsius_to_fahrenheit(@celsius)
  end
end

