require './enumerable_methods.rb'

puts "my_each --> the array should not be affected by the end of the operation"
["Jhon", "Paul", "Dj", "Anna"].my_each { |name|
  upcased = name.upcase
  print  upcased+ " " #To see the upcasing really works on each element
  upcased 
}

puts "my_each_with_index --> the array should not be affected by the end of the operation"
["Jhon", "Paul", "Dj", "Anna"].my_each_with_index { |name, index|
  indexed = name + " " + index.to_s
  print indexed +" " #To see the index really works on each element
  indexed
}

puts "my_select"
["Jhon", "Paul", "Dj", "Anna"].my_select { |name| name != "Dj" }

puts "my_all"
["Jhon", "Paul", "Dj", "Anna"].my_all { |name| name.length >= 2 }

puts "my_any"
["Jhon", "Paul", "Dj", "Anna"].my_any { |name| name.length >= 5 }

puts "my_map --> the array should be affected by the operation"
["Jhon", "Paul", "Dj", "Anna"].my_map { |name|
  upcased = name.upcase
  print upcased + " " #To see the upcasing really works on each element
  upcased
}
