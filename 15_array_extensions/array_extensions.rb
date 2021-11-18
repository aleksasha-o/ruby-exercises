require 'prime'

class Array
  attr_accessor :key

  def square
    self.empty? ? [] : self.map { |i| i ** 2 }
  end

  def square!
    self.empty? ? [] : self.map! { |i| i ** 2 }
  end

  def factorial
    self.map! { |i| (1..i).reduce(1, :*) }
  end

  def each_prime
    i = 0
    arr = []
    while i < self.length
      arr.push(yield(self[i]))
      i += 1
    end
    arr.compact
  end

  def appearance_ratio(*args)
    last_hash = {}
    block = lambda { |element| self.include?(element) ? last_hash[element] = ((self.count(element) * 100 / self.length.to_f) * 0.01).round(3) : last_hash[element] = 0 }
    if args.empty?
      self.uniq.map(&block)
      last_hash
    elsif args[0].is_a?Hash
      num = Hash[*args].map { | key, value | ((self.count(value) * 100 / self.length.to_f) * 0.01).round(3) }
      num[0]
    else
    args.map(&block)
    last_hash
    end
  end

end