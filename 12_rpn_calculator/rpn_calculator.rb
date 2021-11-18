class RPNCalculator

  def initialize
    @stack = []
  end

  def push(number)
    @stack.push(number)
  end

  def stack_pop
    raise 'calculator is empty' if @stack.count < 2
    @number_1 = @stack.pop
    @number_2 = @stack.pop
  end

  def plus
    stack_pop
    push(@number_1 + @number_2)
  end

  def minus
    stack_pop
    push(@number_2 - @number_1)
  end

  def times
    stack_pop
    push(@number_2 * @number_1)
  end

  def divide
    stack_pop
    push(@number_2.to_f / @number_1)
  end

  def value
    @stack[-1]
  end

  def tokens(string_line)
    array_line = []
    string_line.split.each do |symbol|
        if /\d/.match?(symbol)
        array_line << symbol.to_i
        else
        array_line << symbol.to_sym
        end
      end
    array_line
  end

  def evaluate(string_line)
    evaluation = []
    string_line.split.each do |num|
      if /\d/.match?(num)
        evaluation.push(num.to_f)
      else
        operands = evaluation.pop(2)
        evaluation.push(operands[0].send(num, operands[1]))
      end
    end
    evaluation[0].to_f
  end

end

