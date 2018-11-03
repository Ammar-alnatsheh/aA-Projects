class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
        if @count < num_buckets
          idx = num.hash % num_buckets
          @store[idx] << num
          @count += 1
      else
        resize!
        insert(num)
      end
    end
  end

  def remove(num)
    if include?(num)
      idx = num.hash % num_buckets
      @store[idx] = @store[idx].reject { |el| el == num }
      @count -= 1
    end
  end

  def include?(num)
    idx = num.hash % num_buckets
    @store[idx].each do |el|
      return true if num == el
    end
    
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = []
    @store.each do |bucket|
      arr += bucket
    end
    @count = 0
    @store = Array.new(@store.length * 2) {Array.new}
    arr.each do |el|
      insert(el)
    end
    
  end
end
