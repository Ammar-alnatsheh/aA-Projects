class Stack
  attr_reader :root
  def initialize
    # create ivar to store stack here!
    @root = Array.new
  end

  def push(el)
    # adds an element to the stack
    @root.push(el)
    el
  end

  def pop
    # removes one element from the stack
    @root.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @root[-1]
  end
end
