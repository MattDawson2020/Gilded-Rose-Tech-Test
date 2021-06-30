require 'sulfuras'

describe Sulfuras do
  
    let(:subject) { Sulfuras.new('Sulfuras, Hand of Ragnaros', 50, 50)}

    it 'Sulfuras does not degrade quality' do
      subject.update_quality
      expect(subject.quality).to eq 50
    end

    it 'Sulfuras does not degrade sell_in' do
      subject.update_quality
      expect(subject.sell_in).to eq 50
    end

end