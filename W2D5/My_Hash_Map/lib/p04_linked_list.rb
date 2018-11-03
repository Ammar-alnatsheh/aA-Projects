require "byebug"
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev_node = @prev
    next_node = @next
    next_node.prev = prev_node
    prev_node.next = next_node
    @next = nil
    @prev = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head


  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
     @head.next == @tail
  end

  def get(key)
    default = nil
    pointer = @head
    unless (pointer.next == @tail)
      default = pointer if pointer.key == key
      pointer = pointer.next
    end
    default

  end

  def include?(key)
    pointer = @head
    unless (pointer.next == @tail)
      return true if pointer.key == key
      pointer = pointer.next
    end
    false
  end

  def append(key, val)
    unless include?
      node = Node.new(key,val)
      last.next = node
      node.prev = last
      node.next = @tail
      @tail.prev = node
    end
  end

  def update(key, val)
    pointer = @head
    unless (pointer.next == @tail)
      pointer.val = val if pointer.key == key
      pointer = pointer.next
    end
  end

  def remove(key)
    pointer = @head
    unless (pointer.next == @tail)
      pointer.remove = val if pointer.key == key
      pointer = pointer.next
    end
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
