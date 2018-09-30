class Array

  def my_each(&prc)

    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    result = []

    self.my_each do |el|
      result << el if prc.call(el)
    end

    result
  end

  def my_reject(&prc)
    result = []

    self.my_each do |el|
      result << item unless prc.call(el)
    end

    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end

    true
  end

  def my_flatten
    flatten = []

    self.my_each do |el|
      if el.is_a?(Array)
        flatten.concat(el.my_flatten)
      else
        flatten << el
      end
    end

    flatten
  end

  def my_zip(*arrays)
    result = []

    self.length.times do |i|
      sub_array = [self[i]]

      arrays.my_each do |array|
        sub_array << array[i]
      end

      result << sub_array
    end

    result
  end

  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(seperator = "")
    join = ""

    i = 0
    while i < self.length do
      join += self[i]
      join += seperator
      i += 1
    end

    join
  end

  def my_reverse
    result = []

    self.my_each do |el|
     result.unshift(el)
    end

    result
  end

end
