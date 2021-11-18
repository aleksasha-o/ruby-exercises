# frozen_string_literal: true

# loads up the Time.parse method -- do NOT create time.rb!
require 'time'
require 'faker'
require 'bigdecimal/util'

require_relative 'performance_monitor'

describe '#measure' do
  before { @fake_time = Time.parse('2021-1-2 11:00:00') }

  context 'on empty block' do
    let(:elapsed_time) { measure {} }

    it 'takes about 0 seconds to run an empty block' do
      expect(elapsed_time).to be_within(0.1).of(0)
    end

    it 'takes exactly 0 seconds to run an empty block (with stubs)' do
      allow(Time).to receive(:now) { @fake_time }

      expect(elapsed_time).to be_zero
    end
  end

  it 'takes about 1 second to run a block that sleeps for 1 second' do
    elapsed_time = measure { sleep 1 }

    expect(elapsed_time).to be_within(1.1).of(1)
  end

  context 'with stubbed time' do
    before { allow(Time).to receive(:now) { @fake_time } }

    it 'takes exactly 60 seconds to run a block with stub' do
      elapsed_time = measure do
        @fake_time += 60  # adds one minute to fake_time
      end

      expect(elapsed_time).to eq(60)
    end

    it 'runs a block N times' do
      count = 0

      measure(4) { count += 1 }

      expect(count).to eq(4)
    end

    it 'returns the average time, not the total time, when running multiple times' do
      run_times = [8, 6, 5, 7]
      average_time = measure(4) { @fake_time += run_times.pop }

      expect(average_time).to eq(6.5)
    end

    # seconds should be generated with faker
    it 'takes exactly X seconds to run a block with stub' do
      num = Faker::Number.number
      elapsed_time = measure { @fake_time += num } # adds random to fake_time

      expect(elapsed_time).to eq(num)
    end

    # array should be auto-generated
    it "returns the average time with random number of times and durations" do
      run_times = Array.new(rand(1..10)) { rand(61) }
      n = (run_times.sum.to_f / run_times.length).round(2)

      average_time = measure(run_times.length) { @fake_time += run_times.pop }

      expect(average_time).to eq(n)
    end
  end
end
