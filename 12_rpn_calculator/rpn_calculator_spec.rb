# frozen_string_literal: true

require_relative 'rpn_calculator'

describe RPNCalculator do
  it 'adds two numbers' do
    subject.push(2)
    subject.push(3)
    subject.plus

    expect(subject.value).to eq(5)
  end

  it 'adds three numbers' do
    subject.push(2)
    subject.push(3)
    subject.push(4)
    subject.plus

    expect(subject.value).to eq(7)

    subject.plus

    expect(subject.value).to eq(9)
  end

  it 'subtracts the second number from the first number' do
    subject.push(2)
    subject.push(3)
    subject.minus

    expect(subject.value).to eq(-1)
  end

  it 'adds and subtracts' do
    subject.push(2)
    subject.push(3)
    subject.push(4)
    subject.minus

    expect(subject.value).to eq(-1)

    subject.plus

    expect(subject.value).to eq(1)
  end

  it 'multiplies and divides' do
    subject.push(2)
    subject.push(3)
    subject.push(4)
    subject.divide

    expect(subject.value).to eq(3.0 / 4.0)

    subject.times

    expect(subject.value).to eq(2.0 * (3.0 / 4.0))
  end

  it 'resolves operator precedence unambiguously' do
    # 1 2 + 3 * => (1 + 2) * 3
    subject.push(1)
    subject.push(2)
    subject.plus
    subject.push(3)
    subject.times
    expect(subject.value).to eq((1 + 2) * 3)

    # 1 2 3 * + => 1 + (2 * 3)
    subject.push(1)
    subject.push(2)
    subject.push(3)
    subject.times
    subject.plus

    expect(subject.value).to eq(1 + 2 * 3)
  end

  it 'fails informatively when there are not enough values stacked away' do
    expect { subject.plus }.to raise_error('calculator is empty')
    expect { subject.minus }.to raise_error('calculator is empty')
    expect { subject.times }.to raise_error('calculator is empty')
    expect { subject.divide }.to raise_error('calculator is empty')
  end

  describe '#tokens' do
    it 'tokenizes a string' do
      expect(subject.tokens('1 2 3 * + 4 5 - /')).to eq([1, 2, 3, :*, :+, 4, 5, :-, :/])
    end
  end

  describe '#evaluate' do
    it 'evaluates a string' do
      expect(subject.evaluate('1 2 3 * +')).to eq(2 * 3 + 1)
      expect(subject.evaluate('4 5 -')).to eq(4 - 5)
      expect(subject.evaluate('2 3 /')).to eq(2.0 / 3.0)
      expect(subject.evaluate('1 2 3 * + 4 5 - /')).to eq((1.0 + 2 * 3) / (4 - 5))
    end
  end
end
