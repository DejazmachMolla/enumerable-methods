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

  def my_all(arg = nil)
    if block_given?
      my_each { |elem| return false if yield(elem) != true }
      return true #If all elements satisfy the block, we just return true
    end
    if arg.nil?
      my_each { |elem| return false if elem.nil? || elem == false }
    elsif arg.kind_of? Class
      my_each { |elem| return false if elem.class != arg }
    elsif arg.class == Regexp
      my_each { |elem| return false unless arg.match(elem) }
    else
      my_each { |elem| return false if elem != arg }
    end
    true
  end

  #takes argument
  def my_any(arg = nil)
    if block_given?
      my_each { |elem| return true if yield(elem) == true }
      return false #If no element satisfies the block, we just return false
    end
    if arg.nil?
      my_each { |elem| return true if elem.nil? || elem == true }
    elsif arg.kind_of? Class
      my_each { |elem| return true if elem.class == arg }
    elsif arg.class == Regexp
      my_each { |elem| return true if arg.match(elem) }
    else
      my_each { |elem| return true if elem == arg }
    end
    false
  end

  #takes argument
  def my_none(arg = nil)
    if block_given?
      !self.my_any { |elem| yield(elem) }
    else
      !self.my_any(arg)
    end
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