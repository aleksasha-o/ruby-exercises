# frozen_string_literal: true

require 'faker'
require_relative 'xml_document'

describe XmlDocument do
  describe '#method_missing' do
    it 'renders an empty tag' do
      expect(subject.hello).to eq('<hello/>')
    end

    it 'renders a tag with attributes' do
      expect(subject.hello(name: 'dolly')).to eq("<hello name='dolly'/>")
    end

    it 'renders ANY randomly named tag' do
      tag_name = Faker::Lorem.word

      expect(subject.public_send(tag_name)).to eq("<#{tag_name}/>")
    end

    it 'renders block with text inside' do
      expect(subject.hello { 'dolly' }).to eq('<hello>dolly</hello>')
    end

    it 'nests one level' do
      expect(subject.hello { subject.goodbye }).to eq('<hello><goodbye/></hello>')
    end

    it 'nests several levels' do
      result = subject.hello do
                 subject.goodbye do
                   subject.come_back do
                     subject.ok_fine(be: 'that_way')
                   end
                 end
               end

      expect(result)
        .to eq("<hello><goodbye><come_back><ok_fine be='that_way'/></come_back></goodbye></hello>")
    end

    context 'with indentation enabled' do
      subject { described_class.new(true) }

      it 'indents output' do
        result = subject.hello do
                   subject.goodbye do
                     subject.come_back do
                       subject.ok_fine(be: 'that_way')
                     end
                   end
                 end

        expect(result).to eq(
          "<hello>\n" +
          "  <goodbye>\n" +
          "    <come_back>\n" +
          "      <ok_fine be='that_way'/>\n" +
          "    </come_back>\n" +
          "  </goodbye>\n" +
          "</hello>\n"
        )
      end
    end
  end
end
