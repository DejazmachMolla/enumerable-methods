require './enumerable_methods.rb'

# my_each --> the array should not be affected by the end of the operation
["Jhon", "Paul", "Dj", "Anna"].my_each { |name|
  upcased = name.upcase
  print  upcased+ " " #To see the upcasing really works on each element
  upcased 
}

# my_each_with_index --> the array should not be affected by the end of the operation
["Jhon", "Paul", "Dj", "Anna"].my_each_with_index { |name, index|
  indexed = name + " " + index.to_s
  print indexed +" " #To see the index really works on each element
  indexed
}

# my_select
["Jhon", "Paul", "Dj", "Anna"].my_select { |name| name != "Dj" }

# my_all
["Jhon", "Paul", "Dj", "Anna"].my_all { |name| name.length >= 3 }
[].my_all { |name| name.length >= 3 }
# All elements of the array are strings so we expect true
["Jhon", "Paul", "Dj", "Anna"].my_all (String)
# 3 is not a string => all are not strings so we expect false
["Jhon", 3, "Dj", "Anna"].my_all (String)
# some do not contain t => we expect false
["ant", "bear", "cat"].my_all(/t/)
# all contain t => we expect true
["ant", "mosquito", "cat"].my_all(/t/)
# all are ant so we expect true
["ant", "ant", "ant"].my_all("ant")
# all are not ant so we expect false
["ant", "ant", "cat"].my_all("ant")

# my_any
["Jhon", "Paul", "Dj", "Anna"].my_any { |name| name.length >= 3 }

# my_none
# None has length greater than or equal to 5 => we expect true
["Jhon", "Paul", "Dj", "Anna"].my_none { |name| name.length >= 5 }
# There is Dj so we expect false
["Jhon", "Paul", "Dj", "Anna"].my_none("Dj")
# my_count should return 3
["Jhon", "Paul", "Dj", "Anna"].my_count { |name| name.length >= 3 }

# my_count should return 4
["Jhon", "Paul", "Dj", "Anna"].my_count

# my_count should return 1
["Jhon", "Paul", "Dj", "Anna"].my_count("Jhon")

# my_map --> the array should be affected by the operation
["Jhon", "Paul", "Dj", "Anna"].my_map { |name|
  upcased = name.upcase
  print upcased + " " # To see the upcasing really works on each element
  upcased
}

# my_inject
[1, 2, 3, 4].my_inject { |sum, n| sum + n }

# multiply_els
[1, 2, 3, 4].multiply_els