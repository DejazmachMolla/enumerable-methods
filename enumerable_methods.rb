# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    arr = self if self.class == Array
    arr = flatten if self.class == Hash
    arr = to_a if self.class == Range

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
      return true
    end

    if arg.nil?
      my_each { |elem| return false if elem.nil? || elem == false }
    elsif arg.is_a? Class
      my_each { |elem| return false if elem.class != arg }
    elsif arg.class == Regexp
      my_each { |elem| return false unless arg.match(elem) }
    else
      my_each { |elem| return false if elem != arg }
    end
    true
  end

  def my_any(arg = nil)
    if block_given?
      my_each { |elem| return true if yield(elem) == true }
      return false
    end

    if arg.nil?
      my_each { |elem| return true if elem.nil? || elem == true }
    elsif arg.is_a? Class
      my_each { |elem| return true if elem.class == arg }
    elsif arg.class == Regexp
      my_each { |elem| return true if arg.match(elem) }
    else
      my_each { |elem| return true if elem == arg }
    end
    false
  end

  def my_none(arg = nil)
    arr = self
    if block_given?
      !arr.my_any { |elem| yield(elem) }
    else
      !arr.my_any(arg)
    end
  end

  def my_count(num = nil)
    arr = self
    return arr.length if !block_given? && !num

    return arr.my_select { |elem| elem == num }.length if num

    arr.my_select { |elem| yield(elem) }.length
  end

  def my_map
    arr = []
    self_arr = self
    self_arr.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_map_proc(proc = nil)
    arr = []
    self_arr = self
    self_arr.my_each do |elem|
      arr << proc.call(elem)
    end
    arr
  end

  def my_map_proc_block(proc = nil)
    arr = []
    self_arr = self
    if proc
      self_arr.my_each do |elem|
        arr << proc.call(elem)
      end
    else
      self_arr.my_each do |elem|
        arr << yield(elem)
      end
    end
    arr
  end

  def my_inject
    acc = nil
    my_each { |elem| acc = acc.nil? ? elem : yield(acc, elem) }
    acc
  end

  def multiply_els
    arr = self
    arr.my_inject { |res, elem| res * elem }
  end
end
# rubocop: enable Metrics/ModuleLength
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/PerceivedComplexity
