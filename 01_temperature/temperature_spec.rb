# frozen_string_literal: true

require_relative 'temperature'

describe '#fahrenheit_to_celsius' do


  it 'converts boiling temperature' do
    expect(fahrenheit_to_celsius(212)).to eq(100)
  end

  it 'converts freezing temperature' do
    expect(fahrenheit_to_celsius(32)).to be_zero
  end

  it 'converts body temperature' do
    expect(fahrenheit_to_celsius(98.6)).to eq(37)
  end

  it 'converts arbitrary temperature' do
    expect(fahrenheit_to_celsius(68)).to eq(20)
  end
end

describe '#celsius_to_fahrenheit' do
  it 'converts freezing temperature' do
    expect(celsius_to_fahrenheit(0)).to eq(32)
  end

  it 'converts boiling temperature' do
    expect(celsius_to_fahrenheit(100)).to eq(212)
  end

  it 'converts arbitrary temperature' do
    expect(celsius_to_fahrenheit(20)).to eq(68)
  end

  # Hint: bigdecimal and #to_d
  it 'converts body temperature' do
    expect(celsius_to_fahrenheit(37)).to eq(98.6)
  end
end
