module Enumerable
  def my_each
    # your code here
  end
  def my_each_with_index
    # your code here
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
    ary = []
    
    self.each do |elem|
      ary << yield(elem)
    end
    
    ary
  end
  def my_inject
    # your code here
  end
  def multiply_els
    # your code here
  end
end