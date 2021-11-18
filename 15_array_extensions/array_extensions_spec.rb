# frozen_string_literal: true

# we don't call it 'array.rb' since that would be confusing
require_relative 'array_extensions'
require 'prime'

describe Array do
  describe '#square' do
    it 'does nothing to an empty array' do
      expect([].square).to be_empty
    end

    it 'returns a new array containing the squares of each element' do
      expect([1, 2, 3].square).to eq([1, 4, 9])
    end
  end

  describe '#square!' do
    let(:array) { [1, 2, 3] }

    it 'squares each element of the original array' do
      array.square!
      expect(array).to eq([1, 4, 9])
    end
  end

  # Calculates factorial for each element
  # E.g. [2, 5, 7] => [2, 120, 5040]
  describe '#factorial' do
    it 'calculates factorial for each element of the original array' do
      expect([2, 5, 7].factorial).to eq([2, 120, 5040])
    end
  end

  # same as #each, but should be executed only on prime numbers
  # hint: yield in each
  # E.g. [1, 2, 4, 6, 7, 10, 13] => block will be called only on [1, 2, 7, 13]
  describe '#each_prime' do
    it 'calls #each_prime only on prime numbers' do
      expect([1, 2, 4, 6, 7, 10, 13].each_prime { |number| number if number.prime? }).to eq([2, 7, 13])
    end
  end

  # Calculates appearance ratio for specified values.
  # NB. precision is 3 digits after comma
  # If values are not passed, calculates appearance ratio for all existing array elements
  # E.g.
  #
  # [true, true, false].appearance_ratio
  # => { true => 0.667, false => 0.333 }
  #
  # %w[test test word lorem].appearance_ratio('test', 'lorem', 'random')
  # => { 'test' => 0.5, 'lorem' => 0.25, 'random' => 0 }
  #
  # %w[test test word lorem].appearance_ratio(value: 'test')
  # => 0.5
  describe '#appearance_ratio' do
    let(:array) { %w[value1 value1 value2 value1 value2 value3] }

    it 'by default displays appearance ratio for all records' do
      expect(array.appearance_ratio).to eq(
        'value1' => 0.5,
        'value2' => 0.333,
        'value3' => 0.167
      )
    end

    it 'displays appearance ratio for multiple passed values' do
      expect(array.appearance_ratio('value2', 'value3')).to eq(
        'value2' => 0.333,
        'value3' => 0.167
      )
    end

    it 'displays appearance ratio in hash format for one passed value' do
      expect(array.appearance_ratio('value1')).to eq(
      'value1' => 0.5
      )
    end

    it 'displays appearance ratio in hash format for non-existing value' do
      expect(array.appearance_ratio('value9')).to eq(
      'value9' => 0
      )
    end

    context 'for one item passed under `value` key' do
      it 'displays appearance ratio for existing value' do
        expect(array.appearance_ratio(value:'value1')).to eq( 0.5 )
      end

      it 'displays zero appearance ratio for non-existing value' do
        expect(array.appearance_ratio(value:'value9')).to eq( 0 )
      end
    end
  end
end
