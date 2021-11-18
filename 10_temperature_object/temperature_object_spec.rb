# frozen_string_literal: true

require_relative '10_temperature_object'
require_relative 'celsius'
require_relative 'fahrenheit'

describe Temperature do
  context 'can be constructed with an options hash' do
    describe '#in_celsius' do
      it 'works at 50 degrees' do
        expect(described_class.new(celsius: 50).in_celsius).to eq(50)
      end

      it 'works at freezing' do
        expect(described_class.new(fahrenheit: 32).in_celsius).to eq(0)
      end

      it 'works at boiling' do
        expect(described_class.new(fahrenheit: 212).in_celsius).to eq(100)
      end

      it 'works at body temperature' do
        expect(described_class.new(fahrenheit: 98.6).in_celsius).to eq(37)
      end

      it 'works at an arbitrary temperature' do
        expect(described_class.new(fahrenheit: 68).in_celsius).to eq(20)
      end
    end

    context '#in_fahrenheit' do
      it 'works at 50 degrees' do
        expect(described_class.new(fahrenheit: 50).in_fahrenheit).to eq(50)
      end

      context 'and correctly convert to fahrenheit' do
        it 'works at freezing' do
          expect(described_class.new(celsius: 0).in_fahrenheit).to eq(32)
        end

        it 'works at boiling' do
          expect(described_class.new(celsius: 100).in_fahrenheit).to eq(212)
        end

        it 'works at body temperature' do
          expect(described_class.new(celsius: 37).in_fahrenheit).to eq(98.6)
        end
      end
    end
  end

  # Factory Method is a design pattern, not a Ruby language feature.
  # One way to implement this pattern in Ruby is via class methods --
  # that is, methods defined on the class (Temperature) rather than
  # on individual instances of the class.
  describe '.from_celsius' do
    it 'converts to Celsius' do
      expect(described_class.from_celsius(50).in_celsius).to eq(50)
    end

    it 'converts to Fahrenheit' do
      expect(described_class.from_celsius(50).in_fahrenheit).to eq(122)
    end
  end

  describe '.from_fahrenheit' do
    it 'converts to Fahrenheit' do
      expect(described_class.from_fahrenheit(50).in_fahrenheit).to eq(50)
    end

    it 'converts to Celsius' do
      expect(described_class.from_fahrenheit(50).in_celsius).to eq(10)
    end
  end

  # test-driving bonus:
  #
  # 1. make two class methods -- .fahrenheit_to_celsius and .celsius_to_fahrenheit
  # 2. refactor to call those methods from the rest of the object
  #
  # run *all* the tests during your refactoring, to make sure you did it right
  # use auto-generated values in tests
  #
  describe '.fahrenheit_to_celsius' do
    it 'converts to Celsius' do
      expect(described_class.fahrenheit_to_celsius(50)).to eq(10)
    end
  end

  describe '.celsius_to_fahrenheit'do
    it 'converts to Fahrenheit' do
      expect(described_class.celsius_to_fahrenheit(100)).to eq(212)
    end
  end
end

describe Celsius do
  it 'is constructed in Celsius degrees' do
    expect(Celsius.new(50).in_celsius).to eq(50)
    expect(Celsius.new(50).in_fahrenheit).to eq(122)
  end

  it 'is a Temperature subclass' do
    expect(subject).to be_a(Temperature)
  end
end

describe Fahrenheit do
  it 'is constructed in Fahrenheit degrees' do
    expect(Fahrenheit.new(50).in_fahrenheit).to eq(50)
    expect(Fahrenheit.new(50).in_celsius).to eq(10)
  end

  it 'is a Temperature subclass' do
    expect(subject).to be_a(Temperature)
  end
end
