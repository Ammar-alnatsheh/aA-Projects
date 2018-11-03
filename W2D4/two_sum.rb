class Array
  
  def two_sum?(target)
    self.each_with_index do |el,idx|
    
      i = idx + 1
      while i < length
        return true if target == self[i] + el 
        i+=1
      end
    end
    false
  end 
  
  def okay_two_sum?(target)
    arr = self.sort
    
    until arr.empty?
      case arr.first + arr.last <=> target
      when 0
        return true
      when -1
        arr.shift
      when 1
        arr.pop
      end
    end
    
   false
  end
  
  def hash_two_sum?(target)
    h = Hash.new
     self.each do |num|
       h[num] = true
     end
     h.each do |k, _|
       return true if h[ target - k ]
     end
     false
  end
  
end 

small = (-10..10).to_a.shuffle
big = (-1000..1000).to_a.shuffle
really_big = (-100000..100000).to_a.shuffle

p small.two_sum?(5)
p small.two_sum?(5)
p small.two_sum?(5)
p big.okay_two_sum?(5)
p big.okay_two_sum?(5)
p big.okay_two_sum?(5)
p really_big.okay_two_sum?(12462)
p really_big.hash_two_sum?(67392)
