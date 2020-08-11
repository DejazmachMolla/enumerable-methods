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
end