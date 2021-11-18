# frozen_string_literal: true

require_relative 'book_titles'

describe Book do
  describe '#title' do
    it 'should capitalize the first letter' do
      subject.title = 'inferno'

      expect(subject.title).to eq('Inferno')
    end

    it 'should capitalize every word' do
      subject.title = 'stuart little'

      expect(subject.title).to eq('Stuart Little')
    end

    context 'should capitalize every word except...' do
      context 'articles' do
        specify 'the' do
          subject.title = 'alexander the great'

          expect(subject.title).to eq('Alexander the Great')
        end

        specify 'a' do
          subject.title = 'to kill a mockingbird'

          expect(subject.title).to eq('To Kill a Mockingbird')
        end

        specify 'an' do
          subject.title = 'to eat an apple a day'

          expect(subject.title).to eq('To Eat an Apple a Day')
        end
      end

      specify 'conjunctions' do
        subject.title = 'war and peace'

        expect(subject.title).to eq('War and Peace')
      end

      specify 'prepositions' do
        subject.title = 'love in the time of cholera'

        expect(subject.title).to eq('Love in the Time of Cholera')
      end
    end

    context 'should always capitalize...' do
      specify 'I' do
        subject.title = 'what i wish i knew when i was 20'

        expect(subject.title).to eq('What I Wish I Knew When I Was 20')
      end

      specify 'the first word' do
        subject.title = 'the man in the iron mask'

        expect(subject.title).to eq('The Man in the Iron Mask')
      end
    end
  end
end
