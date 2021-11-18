# frozen_string_literal: true

# something is missing again :)
require_relative 'timer'

describe Timer do
  it 'should be initialized to 0 seconds by default' do
    expect(subject.seconds).to be_zero
  end

  describe '#time_string' do
    it 'should display 0 seconds as 00:00:00' do
      expect(subject.time_string).to eq('00:00:00')
    end

    it 'should display 12 seconds as 00:00:12' do
      subject.seconds = 12

      expect(subject.time_string).to eq('00:00:12')
    end

    it 'should display 66 seconds as 00:01:06' do
      subject.seconds = 66

      expect(subject.time_string).to eq('00:01:06')
    end

    it 'should display 4000 seconds as 01:06:40' do
      subject.seconds = 4000

      expect(subject.time_string).to eq('01:06:40')
    end
  end


  # try to make it using string formatting instead of if/else condition
  describe '#padded' do
    it 'pads zero' do
      expect(subject.padded(0)).to eq('00')
    end

    it 'pads one' do
      expect(subject.padded(1)).to eq('01')
    end

    it 'does not pad a two-digit number' do
      expect(subject.padded(12)).to eq('12')
    end
  end
end
