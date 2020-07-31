require './enumerable_methods.rb'
names = %w[Jhon Paul Dj Anna]
# my_each --> the array should not be affected by the end of the operation
names.my_each do |name|
  upcased = name.upcase
  print upcased + ' ' # To see the upcasing really works on each element
  upcased
end

names.each.is_a?(Enumerator)
names.my_each.is_a?(Enumerator)

# my_each_with_index --> the array should not be affected by the end of the operation
names.my_each_with_index do |name, index|
  indexed = name + ' ' + index.to_s
  print indexed + ' ' # To see the index really works on each element
  indexed
end

names.my_each_with_index.is_a?(Enumerator)

# my_select
names.my_select { |name| name != 'Dj' }

# my_all
names.my_all { |name| name.length >= 3 }
[].my_all { |name| name.length >= 3 }
# All elements of the array are strings so we expect true
names.my_all String
# 3 is not a string => all are not strings so we expect false
['Jhon', 3, 'Dj', 'Anna'].my_all String
# some do not contain t => we expect false
%w[ant bear cat].my_all(/t/)
# all contain t => we expect true
%w[ant mosquito cat].my_all(/t/)
# all are ant so we expect true
%w[ant ant ant].my_all('ant')
# all are not ant so we expect false
%w[ant ant cat].my_all('ant')

# my_any
names.my_any { |name| name.length >= 3 }
false_array = [nil, false, nil, false]
false_array.any?
false_array.my_any

# my_none
# None has length greater than or equal to 5 => we expect true
names.my_none { |name| name.length >= 5 }
false_array.none?
false_array.my_none
# There is Dj so we expect false
names.my_none('Dj')
# my_count should return 3
names.my_count { |name| name.length >= 3 }

# my_count should return 4
names.my_count

# my_count should return 1
names.my_count('Jhon')

# my_map --> the array should be affected by the operation
names.my_map do |name|
  upcased = name.upcase
  print upcased + ' ' # To see the upcasing really works on each element
  upcased
end
# my_map_proc
p = proc { |name| name.upcase.to_s + ' PROC' }
names.my_map(p)

# my_map_proc_block with block
names.my_map { |name| name.upcase.to_s + ' PROC_BLOCK BLOCK' }

# my_map_proc_block with proc
p = proc { |name| name.upcase.to_s + ' PROC_BLOCK PROC ' }
names.my_map(p)

# my_inject
[1, 2, 3, 4].my_inject { |sum, n| sum + n }

# my_inject with initial accumulator value
[1, 2, 3, 4].my_inject(40) { |sum, n| sum + n }
array.inject(:+)
array.my_inject(:+)

# multiply_els
[1, 2, 3, 4].multiply_els
