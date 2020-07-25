require './enumerable_methods.rb'

puts "my_each --> the array should not be affected by the end of the operation"
["Jhon", "Paul", "Dj", "Anna"].my_each { |name| 
  print name.upcase + " " #To see the upcasing really works on each element
  name.upcase 
}

puts "my_map --> the array should be affected by the operation"
["Jhon", "Paul", "Dj", "Anna"].my_map { |name|  
  print name.upcase + " " #To see the upcasing really works on each element
  name.upcase
}
