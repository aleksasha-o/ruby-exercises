require 'time'
require 'bigdecimal/util'

def measure(count = 1)
  first_time = Time.now
  count.times { yield }
  second_time = Time.now
  ((second_time - first_time) / count).round(2)
end
