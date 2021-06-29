require 'backstage_pass'

describe BackStagePass do

  let(:subject) { BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)}
  
    it 'Reduces the sell_in of passes' do
      subject.update_quality
      expect(subject.sell_in).to eq 19
    end
    
    it 'Can set pass quality to 0 when sell_in goes below 0' do
      expired_pass = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)
      expired_pass.update_quality
  
      expect(expired_pass.quality).to eq 0
    end
  
    it 'Pass quality increases by 3 a day when sell_in is 5 or less' do
      aged_pass = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)
      aged_pass.update_quality
      expect(aged_pass.quality).to eq 23
  
      aged_pass.update_quality
      expect(aged_pass.quality).to eq 26
    end
  
    it 'Pass quality increases by 2 a day when sell_in between 5 and 10 days' do
      aged_pass = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
      aged_pass.update_quality
      expect(aged_pass.quality).to eq 22
  
      aged_pass.update_quality
      expect(aged_pass.quality).to eq 24
    end
  
end
