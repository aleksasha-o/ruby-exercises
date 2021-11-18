def translate_word(word)
  symbols = /\W/

  if symbols.match?(word)
    sym = word.slice!(symbols)
    translate_part_with_sym(word, sym)
  else
    translate_part_with_sym(word)
  end
end

def translate_part_with_sym(word, sym = nil)
  vowels = /a|e|i|o|u|y/

  qu = /^[^aeiouy]*qu/
  letters = word.chars

  case
  when letters[0] == "q" && letters[1] == "u"
    "#{word[2..-1]}#{letters[0..1].join}ay#{sym}"
  when vowels.match?(letters[0])
    word + "ay#{sym}"
  else
    if letters.to_s.downcase != letters.to_s
      letters.to_s.downcase!
      if !vowels.match?(letters[1]) && !vowels.match?(letters[2])
        "#{word[3..-1]}#{letters[0..2].join}ay#{sym}".capitalize!
      elsif qu.match?(word)
        ogrizok = word.slice!(qu)
        "#{word}#{ogrizok}ay#{sym}".capitalize!
      elsif !vowels.match?(letters[1])
        "#{word[2..-1]}#{letters[0..1].join}ay#{sym}".capitalize!
      else
        "#{word[1..-1]}#{letters[0]}ay#{sym}".capitalize!
      end
    else
      letters.to_s.downcase!
      if !vowels.match?(letters[1]) && !vowels.match?(letters[2])
        "#{word[3..-1]}#{letters[0..2].join}ay#{sym}"
      elsif qu.match?(word)
        ogrizok = word.slice!(qu)
        "#{word}#{ogrizok}ay#{sym}"
      elsif !vowels.match?(letters[1])
        "#{word[2..-1]}#{letters[0..1].join}ay#{sym}"
      else
        "#{word[1..-1]}#{letters[0]}ay#{sym}"
      end
    end
  end
end

def translate(phrase)
  phrase.split.map { |word| translate_word(word) }.join(' ')
end