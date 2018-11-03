class Map
  attr_reader :root
  def initialize
    # create ivar to store map here!
    @root = []
  end

  def set(key, value)
    # set a a key to a value if not exist otherwise it will create a new one

    # get the index of the key in the map, if not exist idx will equal its length
    idx = 0
    while idx < @root.length
      break if @root[idx][] == key
      idx+=1
    end

    if idx == @root.length
      @root.push([key,value])
    else
      @root[idx] = [key,value]
    end
  end

  def get(key)
    # get the index of the key in the map, if not exist idx will equal its length
    idx = 0
    while idx < @root.length
      break if @root[idx][] == key
      idx+=1
    end
    element = nil
    element = @root[idx] if idx != @root.length
    element[1]
  end

  def delete(key)
    # delete the key and its value and change the map
    @root.reject! { |el| el[0] == key }
    value = get(key)
  end

  def show
    #show ll the elements in the array
    result = []
    @root.each do |el|
      if el.is_a?(Array)
        result << deep_dup(el)
      else
        result << el
      end
    end
    result
  end

end
