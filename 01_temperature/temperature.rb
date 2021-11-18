require 'bigdecimal/util'

def fahrenheit_to_celsius(fahrenheit)
    5.0 / 9.0 * (fahrenheit - 32.0)
  end

  def celsius_to_fahrenheit(celsius)
    (9.0 / 5.0 * celsius.to_d + 32).to_f
  end