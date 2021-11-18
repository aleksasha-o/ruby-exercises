class Book

  def title
    words = @title.split
    exceptions = %w[and in the of a an]
    case
    when (words & exceptions).any?
      words.each { |word| exceptions.include?(word) ? word : word.capitalize! }
      words[0].capitalize!
      words.join(' ')
    else
      words.map { |word| word.capitalize }.join(' ')
    end
  end

  def title=(phrase)
    @title = phrase
  end

end


