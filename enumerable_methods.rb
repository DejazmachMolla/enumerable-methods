# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    arr = self if self.class == Array
    arr = flatten if self.class == Hash
    arr = to_a if self.class == Range
    count = 0
    while count < arr.length
      yield(arr[count], count)
      count += 1
    end
    p arr
    arr
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    my_each { |elem, count| yield(elem, count) }
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []
    my_each { |elem| selected << elem if yield(elem) }
    selected
  end

  def my_all?(arg = nil)
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

  def my_any?(arg = nil)
    if block_given?
      my_each { |elem| return true if yield(elem) == true }
      return false
    end

    if arg.nil?
      my_each { |elem| return true if elem == true || (!elem.nil? && !elem == false) }
    elsif arg.is_a? Class
      my_each { |elem| return true if elem.class == arg }
    elsif arg.class == Regexp
      my_each { |elem| return true if arg.match(elem) }
    else
      my_each { |elem| return true if elem == arg }
    end
    false
  end

  def my_none?(arg = nil)
    arr = self
    if block_given?
      !arr.my_any? { |elem| yield(elem) }
    else
      !arr.my_any?(arg)
    end
  end

  def my_count(num = nil)
    arr = self
    return arr.length if !block_given? && !num

    return arr.my_select { |elem| elem == num }.length if num

    arr.my_select { |elem| yield(elem) }.length
  end

  def my_map(*arg)
    return to_enum(:my_map) unless block_given?

    arr = []
    self_arr = self
    if arg[0]
      self_arr.my_each do |elem|
        arr << arg[0].call(elem)
      end
    else
      self_arr.my_each do |elem|
        arr << yield(elem)
      end
    end
    arr
  end

  def my_inject(*args)
    acc = nil
    if args[0].is_a?(Symbol)
      my_each { |elem| acc = acc.nil? ? elem : acc.send(args[0], elem) }
    elsif args[0].nil?
      my_each { |elem| acc = acc.nil? ? elem : acc = yield(acc, elem) }
    elsif args[1].nil?
      acc = args[0]
      my_each { |elem| acc = yield(acc, elem) }
    else
      acc = args[0]
      my_each { |elem| acc = acc.send(args[1], elem) }
    end
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
