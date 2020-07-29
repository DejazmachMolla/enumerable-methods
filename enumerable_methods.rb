module Enumerable
  def my_each
    arr = self if self.class == Array
    arr = self.flatten if self.class == Hash
    arr = self.to_a if self.class == Range

    count = 0
    while count < arr.length
      yield(arr[count], count)
      count += 1
    end
    
    self
  end

  def my_each_with_index
    my_each { |elem, count| yield(elem, count) }
  end

  def my_select
    selected = []
    my_each { |elem| selected << elem if yield(elem) }
    selected
  end

  #takes argument
  def my_all
    my_each { |elem| return false if yield(elem) != true }
    true
  end

  #takes argument
  def my_any
    my_each { |elem| return true if yield(elem) == true }
    false
  end

  #takes argument
  def my_none
    !self.my_any { |elem| yield(elem) }
  end

  
  def my_count(num = nil)
    if !block_given? && !num
      return self.length 
    end

    return self.my_select { |elem| elem == num }.length if num

    self.my_select { |elem| yield(elem) }.length
  end

  def my_map
    array = []
    
    self.my_each do |elem|
      array << yield(elem)
    end
    
    array
  end

  def my_inject
    acc = nil
    my_each { |elem| acc = acc.nil? ? elem : yield(acc, elem) }
    acc
  end

  def multiply_els
    self.my_inject { |res, elem| res * elem }
  end
end