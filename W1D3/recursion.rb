#takes a range and returns an array of all numbers in that range except the last number
def range(first,last)
  return [] if first == last
  [first] << range(first+1,last)
end

# get the exponent using recursive
def exp(number,power)
  return 1 if power == 0
  number * exp(number,power-1)
end

# make a deep copy of the array
def deep_dup(arr)
  new_arr = []
  arr.each do |el|
    if el.is_a?(Array)
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end
  new_arr
end

# use recursive way to create a Fibonacci seq with n number
def fibonacci(n)
  return [1] if n < 2
  return [1,1] if n == 2
  result = fibonacci(n-1)
  result << result[-1] + result[-2]
end

def bsearch(arr,num)
  return nil if arr == nil
  return 0 if arr[0] == num
  return nil if bsearch(arr[1..-1],num) == nil
  1 + bsearch(arr[1..-1],num)
end

def merge_sort(arr)
  return arr if arr.length == 1
  half = arr.length / 2
  half1 = merge_sort(arr[0...half])
  half2 = merge_sort(arr[half..-1])
  merge_helper(half1,half2)
end


def merge_helper(half1,half2)
  result =[]
  while half1.length !=0 && half2.length != 0 do
    if half1.first <= half2.first
      result.push(half1.first)
      half1.shift
    else
      result.push(half2.first)
      half2.shift
    end
  end
  result + half1 + half2
end

def subsets(arr)
  return [arr] if arr.length <= 0
  subs = subsets(arr[0..-2])
  subs.concat(subs.map{|el| el += [arr.last]})

end

def permutations(arr)
  return arr if arr.length < 2
  el = array.shift
  perms = permutations(array)
  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations.sort
end
