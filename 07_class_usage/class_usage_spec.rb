# frozen_string_literal: true

require_relative 'friend'
require 'faker'

describe Friend do
  # this line can be removed and it would implicitly work the same way
  subject { described_class.new }
  let! (:name) { Faker::Name.unique.name }

  describe '#greet' do
    it 'says hello' do
      expect(subject.greet).to eq('Hello!')
    end

    it 'says hello to Bob' do
      expect(subject.greet('Bob')).to eq('Hello, Bob!')
    end

    it 'says hello to you' do
      expect(subject.greet('Sasha')).to eq('Hello, Sasha!')
    end

    # randomize the name using Faker
    it 'says hello to anyone' do
      expect(subject.greet("#{name}")).to eq("Hello, #{name}!")
    end

  end
end
