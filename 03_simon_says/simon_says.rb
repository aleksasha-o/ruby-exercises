def echo(phrase)
  phrase
end

def shout(phrase)
  phrase.upcase
end

def repeat(phrase, count=2)
  [phrase] * count * " "
end

def start_of_word(phrase, letter)
  phrase[0, letter]
end

def first_word(phrase)
  phrase.split[0]
end

def titleize(phrase)
  first = phrase.split[0].capitalize
  words = %w[and the over]
  phrase.split.map.with_index { |word, index| index!=0&&words.include?(word) ? word : word.capitalize }.join(" ")
end
