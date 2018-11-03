class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    default_string = self.to_s
    default_value = ""
    default_string.chars.each do |char|
      default_value += char.ord.to_s
    end
    
    default_value.to_i.hash
  end
end

class String
  def hash
    default_value = ""
    self.chars.each do |char|
      default_value += char.ord.to_s
    end
    
    default_value.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    (self.keys.sort.to_s << self.values.sort.to_s).hash
  end
end
