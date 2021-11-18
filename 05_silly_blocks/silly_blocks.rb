def reverser
  value = yield
  value.split.map { |word| word.reverse }.join(' ')
end

def adder(num_add = 1)
  num = yield
  num + num_add
end

def repeater(count = 1)
  count.times { yield }
end