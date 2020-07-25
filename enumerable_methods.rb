module Enumerable
  def my_each
    count = 0
    while count < self.length
      yield(self[count])
      count += 1
    end
    
    self
  end
  def my_each_with_index
    count = 0
    while count < self.length
      yield(self[count], count)
      count += 1
    end
    
    self
  end
  
  def my_select
    # your code here
  end
  def my_all
    # your code here
  end
  def my_any
    # your code here
  end
  def my_none
    # your code here
  end
  def my_count
    # your code here
  end
  def my_map
    array = []
    
    self.my_each do |elem|
      array << yield(elem)
    end
    
    array
  end
  def my_inject
    # your code here
  end
  def multiply_els
    # your code here
  end
end