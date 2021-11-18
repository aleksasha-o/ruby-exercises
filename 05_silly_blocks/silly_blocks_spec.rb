# frozen_string_literal: true

require_relative 'silly_blocks'
require 'faker'


describe '#reverser' do
  it 'reverses the string returned by the default block' do
    expect(reverser { 'hello' }).to eq('olleh')
  end

  it 'reverses each word in the string returned by the default block' do
    expect(reverser { 'hello dolly' }).to eq('olleh yllod')
  end
end

describe '#adder' do
  it 'adds one to the value returned by the default block' do
    expect(adder { 5 }).to eq(6)
  end

  it 'adds 3 to the value returned by the default block' do
    result = adder(3) { 5 }
    expect(result).to eq(8)
  end
end

describe '#repeater' do
  it 'executes the default block' do
    block_was_executed = false

    repeater { block_was_executed = true }

    expect(block_was_executed).to eq(true)
  end

  it 'executes the default block 3 times' do
    counter = 0

    repeater(3) { counter += 1 }

    expect(counter).to eq(3)
  end

  it 'executes the default block 10 times' do
    counter = 0

    repeater(10) do
      counter += 1
    end

    expect(counter).to eq(10)
  end

  context 'with random amount of times' do
    # generate count argument randomly under #let statement
    it 'executes block exactly such amount of times' do
    counter = rand(1..99)

    repeater(counter) { counter += 1 }

    expect(counter).to eq(counter)
  end
  end
  end
