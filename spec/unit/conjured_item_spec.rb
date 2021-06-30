require 'conjured_item'

describe ConjuredItem do
  
    let(:subject) { ConjuredItem.new('subject', 20, 20) }

    it 'subject items quality degrades twice as fast as regular' do
      subject.update_quality
      expect(subject.quality).to eq 18
    end

    it 'Reduces subject items sell_in' do
      subject.update_quality
      expect(subject.sell_in).to eq 19
    end

    it 'subject items cannot go below minimum' do
      subject.update_quality
      expect { 15.times {subject.update_quality } }.to raise_error 'Item below minimum quality'
    end

end