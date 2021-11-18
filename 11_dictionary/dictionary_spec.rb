# frozen_string_literal: true

require_relative 'dictionary'

describe Dictionary do
  describe '#entries' do
    it 'is empty when created' do
      expect(subject.entries).to eq({})
    end

    it 'can add whole entries with keyword and definition' do
      subject.add('fish' => 'aquatic animal')

      expect(subject.entries).to eq({ 'fish' => 'aquatic animal' })
    end

    it 'add keywords (without definition)' do
      subject.add('fish')

      expect(subject.entries).to eq({ 'fish' => nil })
    end
  end

  describe '#keywords' do
    it 'can add whole entries with keyword and definition' do
      subject.add('fish' => 'aquatic animal')

      expect(subject.keywords).to eq(['fish'])
    end

    it 'add keywords (without definition)' do
      subject.add('fish')

      expect(subject.keywords).to eq(['fish'])
    end

    it 'lists keywords alphabetically' do
      subject.add('zebra' => 'African land animal with stripes')
      subject.add('fish' => 'aquatic animal')
      subject.add('apple' => 'fruit')

      expect(subject.keywords).to eq(%w[apple fish zebra])
    end
  end

  describe '#include?' do
    it 'can check whether a given keyword exists' do
      expect(subject.include?('fish')).to eq(false)
    end

    it 'does not cheat when checking whether a given keyword exists' do
      # if the method is empty, this test passes with nil returned
      expect(subject.include?('fish')).to eq(false)

      subject.add('fish')

      # confirms that it actually checks
      expect(subject.include?('fish')).to eq(true)

      # confirms not always returning true after add
      expect(subject.include?('bird')).to eq(false)
    end

    it 'does not include a prefix that was not added as a word in and of itself' do
      subject.add('fish')

      expect(subject.include?('fi')).to eq(false)
    end
  end

  describe '#exclude?' do
    it 'works on non-existing keywords' do
      # if the method is empty, this test passes with nil returned
      expect(subject.exclude?('fish')).to eq(true)

      subject.add('fish')

      # confirms that it actually checks
      expect(subject.exclude?('fish')).to eq(false)

      # confirms not always returning true after add
      expect(subject.exclude?('bird')).to eq(true)
      expect(subject.exclude?('animal')).to eq(true)
    end

    it 'does not include a part of keyword' do
      subject.add('fish')

      expect(subject.exclude?('fi')).to eq(true)
    end
  end

  describe '#find' do
    it 'does not find a word in empty dictionary' do
      expect(subject.find('fi')).to be_empty # {}
    end

    it 'finds nothing if the prefix matches nothing' do
      subject.add('fiend')
      subject.add('great')

      expect(subject.find('nothing')).to be_empty
    end

    it 'finds an entry' do
      subject.add('fish' => 'aquatic animal')

      expect(subject.find('fish')).to eq({ 'fish' => 'aquatic animal' })
    end

    it 'finds multiple matches from a prefix and returns the entire entry (keyword + definition)' do
      subject.add('fish' => 'aquatic animal')
      subject.add('fiend' => 'wicked person')
      subject.add('great' => 'remarkable')

      expect(subject.find('fi')).to eq({ 'fish' => 'aquatic animal', 'fiend' => 'wicked person' })
    end
  end

  describe '#printable' do
    it 'can produce printable output like so: [keyword] "definition"' do
      subject.add('zebra' => 'African land animal with stripes')
      subject.add('fish' => 'aquatic animal')
      subject.add('apple' => 'fruit')

      expect(subject.printable).to eq(
        "[apple] \"fruit\"\n[fish] \"aquatic animal\"\n[zebra] \"African land animal with stripes\""
      )
    end
  end
end
