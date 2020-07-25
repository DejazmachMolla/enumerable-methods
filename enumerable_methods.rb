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
    selected = []
    count = 0
    while count < self.length
      if yield(self[count])
        selected << self[count]
      end
      count += 1
    end
      selected
  end

  def my_all
    count = 0
    while count < self.length
      if yield(self[count]) != true
        return false
      end
      count += 1
    end
    true
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