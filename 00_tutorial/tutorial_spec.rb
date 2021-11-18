# frozen_string_literal: true

require_relative 'tutorial'

describe 'the kek function' do
  it 'says lol' do
    expect(kek).to eq('Lol!')
  end
end

describe 'the greet function' do
  it 'says hello to amigo' do
    expect(greet('amigo')).to eq('Holla, amigo!')
  end

  it 'does not raise an error when nil is passed' do
    expect(greet(nil)).to eq('Holla, !')
  end

  it 'says hello to you' do
    expect(greet('Sasa')).to eq('Holla, Sasa!')
  end

end
