class Array
  
  def my_min_slow
    default = self.first
    self.each do |el|
      return el if self.select{|el2| el > el2}.empty?
    end
    nil
  end

  def my_min_fast
    result = self.shift
    self.each do |el|
      result = el if el < result
      
    end 
    result
  end 



  def my_sub_slow
    subs = []
    for i in (0...length)
      for k in (i...length)
        subs << self[k..-1]
      end
    end
    result = subs.first.reduce(:+)
    subs.each do |el|
      temp = el.reduce(:+)
      result = temp if temp > result
    end
    result
  end
  
  
  
  def my_sub_sum_fast
    result = self[0]
    current = 0
  
    self.each do |el|
      current += el 
      result = current if current > result
      current = 0 if current < 0
    end
    result 
  end 
  
end 
 
