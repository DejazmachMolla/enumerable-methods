require_relative '../enumerable_methods.rb'

# spec/enumerable_methods_spec.rb
describe Enumerable do
  let (:test_array) { [1, 2, 5, 3]}

  describe '#my_each' do
    it 'returns the array itself' do
      expect(test_array.my_each.to_a).to eql(test_array)
    end

    it 'operation affects each element' do
      affected_array = []
      test_array.my_each do |elem|
        affected_array << elem + 2
      end
      expect(affected_array).to eql([3, 4, 7, 5])
    end
  end

  describe '#my_each_with_index' do
    it 'returns the array itself' do
      expect(test_array.my_each_with_index.to_a).to eql([[1, 0], [2, 1], [5, 2], [3, 3]])
    end

    it 'operation affects each element' do
      affected_array = []
      test_array.my_each_with_index do |elem, index|
        affected_array << elem + index
      end
      expect(affected_array).to eql([1, 3, 7, 6])
    end
  end

  describe '#my_select' do
    it 'selects even numbers only' do
      expect(test_array.my_select { |elem| elem % 2 == 0 }).to eql([2])
    end
  end

  describe '#my_all?' do
    it 'returns false since all are not even' do
      expect(test_array.my_all? { |elem| elem % 2 == 0 }).to eql(false)
    end
  end

  describe '#my_any?' do
    it 'returns true since some elements are odd' do
      expect(test_array.my_any? { |elem| elem % 2 != 0 }).to eql(true)
    end

    it 'returns false since all are below 7' do
      expect(test_array.my_any? { |elem| elem > 10 }).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'returns true since no element is negative' do
      expect(test_array.my_none? { |elem| elem < 0 }).to eql(true)
    end

    it 'returns false since some elements are odd' do
      expect(test_array.my_none? { |elem| elem % 2 != 0 }).to eql(false)
    end
  end

  describe '#my_count?' do
    it 'returns the number of odd elements' do
      expect(test_array.my_count { |elem| elem % 2 != 0 }).to eql(3)
    end
  end

  describe '#my_map' do
    it 'returns the modifid array' do
      expect(test_array.my_map { |elem| elem * 2 }).to eql([2, 4, 10, 6])
    end

    it 'works with proc' do
      p = proc { |elem| elem + 1 }
      expect(test_array.my_map(p)).to eql([2, 3, 6, 4])
    end
  end

  describe '#my_inject' do
    it 'returns the sum of the array elements' do
      expect(test_array.my_inject {  |sum, n| sum + n  }).to eql(11)
    end

    it 'takes accumulator and returns the sum of the array elements' do
      expect(test_array.my_inject(10) {  |sum, n| sum + n  }).to eql(21)
    end

    it 'takes Symbol and returns the multiplication of the array elements' do
      expect(test_array.my_inject(:*)).to eql(30)
    end
  end

end