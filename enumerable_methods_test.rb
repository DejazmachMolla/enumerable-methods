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

puts "my_map --> the array should be affected by the operation"
["Jhon", "Paul", "Dj", "Anna"].my_map { |name|
  upcased = name.upcase
  print upcased + " " #To see the upcasing really works on each element
  upcased
}
