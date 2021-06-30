require 'aged_brie'

describe AgedBrie do
  context 'Aged Brie' do
    let(:subject) { AgedBrie.new("Aged Brie", 20, 20) }

    it 'Increases the quality of Aged Brie' do
      subject.update_quality
      expect(subject.quality).to eq 21
    end

    it 'Reduces the sell_in of Aged Brie' do
      subject.update_quality
      expect(subject.sell_in).to eq 19
    end

    it 'Brie cannot exceed maximum quality' do
      subject.update_quality
      expect { 31.times { subject.update_quality } }.to raise_error 'Cannot exceed maximum quality'
    end

  end

end
