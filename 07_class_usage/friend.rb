class Friend
  def greet(whose = nil)
    whose ? "Hello, #{whose}!" : 'Hello!'
  end
end