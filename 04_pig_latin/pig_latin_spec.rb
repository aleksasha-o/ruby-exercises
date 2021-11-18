# frozen_string_literal: true

# something is missing :)

require_relative 'pig_latin'

describe '#translate' do
  it 'translates a word beginning with a vowel' do
    expect(translate('apple')).to eq('appleay')
  end

  it 'translates a word beginning with a consonant' do
    expect(translate('banana')).to eq('ananabay')
  end

  it 'translates a word beginning with two consonants' do
    expect(translate('cherry')).to eq('errychay')
  end

  it 'translates a word beginning with three consonants' do
    expect(translate('three')).to eq('eethray')
  end

  it 'translates two words' do
    expect(translate('eat pie')).to eq('eatay iepay')
  end



  it 'counts "sch" as a single phoneme' do
    expect(translate('school')).to eq('oolschay')
  end

  it 'counts "qu" as a single phoneme' do
    expect(translate('quiet')).to eq('ietquay')
  end

  it 'counts "qu" as a consonant even when it is preceded by a consonant' do
    expect(translate('square')).to eq('aresquay')
  end

  it 'translates many words' do
    expect(translate('the quick brown fox')).to eq('ethay ickquay ownbray oxfay')
  end

  # capitalized words remain capitalized
  # (but with a different initial capital letter, of course)
  it 'translates capitalized words' do
    expect(translate('The quick Brown foX')).to eq('Ethay ickquay Ownbray Oxfay')
  end

  # retains the punctuation from the original phrase
  it 'translates phrase with punctuation' do
    expect(translate('The quick Brown fox.')).to eq('Ethay ickquay Ownbray oxfay.')
  end
end
