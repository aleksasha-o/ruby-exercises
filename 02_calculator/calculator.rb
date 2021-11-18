require 'bigdecimal/util'

def add(number_1, number_2)
  number_1 + number_2
end

def subtract(number_1, number_2)
  number_1 - number_2
end

def sum(array)
  array.reduce(0, :+)
end

def multiply(*array)
  puts array.inspect
  array.reduce(1, :*)
end

def power(num, pow)
  num ** pow
end

def factorial(num)
  (1..num).reduce(1, :*)
end