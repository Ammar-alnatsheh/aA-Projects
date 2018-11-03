class Queue
  attr_reader :root
  def initialize
  # create ivar to store queue here!
    @root = []
  end

  def enqueue(el)
  # adds an element to the queue
    @root.push(el)
    el
  end

  def dequeue
  # removes one element from the queue
    @root.shift
  end

  def peek
  # returns, but doesn't remove, the first element in the queue
    @root[0]
  end

end
