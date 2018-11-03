require "byebug"
class PolyTreeNode

  def initialize(value, children=[])
    @value = value
    @children = children
    @parent = nil
    children.each do |child|
      child.parent = self
    end
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(new_parent)

    if new_parent == nil

      if @parent != nil
        parent.children.reject! { |el| el == self }
      end
      @parent = nil

    elsif @parent != new_parent
      if @parent
        @parent.remove_child(self)
      end
      new_parent.children << self
      @parent = new_parent
    end

  end

  def remove_child(child)
    raise "Node is not a child" unless @children.include?(child)
    child.parent=(nil)
  end

  def add_child(child)
    child.parent=(self)
  end

  def inspect
    "node value #{self.value}, children = #{@children}"
  end

  def dfs(target)
    return self if self.value == target
    return nil if self.children == []
    self.children.each do |child|
      return child.dfs(target) unless child.dfs(target) == nil
    end
    nil
  end

  def bfs(target)
    queue = []
    queue.push(self)
    until queue == []
      return queue.first if queue.first.value == target
      queue += queue.first.children
      queue.shift
    end
    nil
  end
end
