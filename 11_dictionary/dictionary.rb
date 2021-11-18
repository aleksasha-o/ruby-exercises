class Dictionary
  @@find_hash = {}

  def initialize
    @hash = {}
  end

  def entries
    @hash
  end

  def add(key_value)
    if key_value.is_a?(String)
      @hash[key_value] = nil
      else
    key_value.each do |key, value|
      @hash[key] = value
      end
    end
  end

  def keywords
    @hash.keys.sort
  end

  def include?(keyword)
    @hash.has_key?(keyword)
  end

  def exclude?(keyword)
    !@hash.has_key?(keyword)
  end

  def split_key(word)
    check = false
    input_key_letters = word.chars
    @hash.each do |key, value|
      hash_letters = key.chars
      if hash_letters.include?(input_key_letters[0])&&hash_letters.include?(input_key_letters[1])
        check = true
        @@find_hash[key] = value
      end
    end
    check
  end

  def find(word)
    if @hash.empty? || !split_key(word)
      {}
    else
      @@find_hash
    end
  end

  def printable
    output_line = ""
    @hash.each do |key, value|
      output_line.insert(0, "[#{key}] \"#{value}\"\n")
    end
    output_line.delete_suffix!("\n")
  end

end