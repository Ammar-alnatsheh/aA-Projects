#calculate the sum from 1 to n
def sum_to(n)
  return nil if n < 1
  return 1 if n==1
  n + sum_to(n-1)
end

#takes in an array of Fixnums and returns the sum of those numbers
def add_numbers(nums_array)
  return nums_array[0] if nums_array.length <=1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

#solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!
def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

#ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors
#available at the ice cream shop,as well as the user's favorite ice cream flavor.
#Recursively find out whether or not the shop offers their favorite flavor.
def ice_cream_shop(flavors, favorite)
return flavors[0] == favorite if flavors.length <=1
flavors[0] == favorite || ice_cream_shop(flavors[1..-1], favorite)
end

#that takes in a string and returns it reversed.
def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end
