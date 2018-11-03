class String 
  
  def first_anagram?(string)
    array = self.chars.permutation
    array = array.map {|el| el.join}
    array.include?(string)
  end 
  
  def second_anagram?(string)
    self.chars.uniq.each do |char|
      return false unless self.count(char) == string.count(char)
    end
    true
  end 
  
  def third_anagram?(string)
    self.chars.sort == string.chars.sort
  end
  
  def fourth_anagram?(str)
    first = Hash.new(0)
    second = Hash.new(0)
    self.each_char { |chr|  first[chr] += 1}
    str.each_char {|chr| second[chr] += 1}
    first == second
  end 
  
  def bonus_anagram?(str)
    counter = Hash.new(0)
    self.each_char {|chr| counter[chr] += 1}
    str.each_char {|chr| counter[chr] -= 1}
    counter.all? {|_, v| v == 0}
  end 
  
end 