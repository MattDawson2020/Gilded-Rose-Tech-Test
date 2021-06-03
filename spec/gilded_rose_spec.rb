require 'gilded_rose'

describe GildedRose do

  describe '#old_update' do
    it "Does not change the name" do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).old_update()
      expect(items[0].name).to eq 'foo'
    end
  end

  context '#update_quality' do
    it 'Lets regular items above sell_in degrade normally' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 9
    end

    it 'Lets regular items below sell_in degrade faster' do
      items = [Item.new('foo', 0, 10)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 8
    end

    it 'Lets reduces regular items sell_in' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality

      expect(items.first.sell_in).to eq 9
    end

  end

  context 'Aged Brie' do
    it 'Increases the quality of Aged Brie' do
      items = [Item.new("Aged Brie", 20, 0)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 1
    end

    it 'Reduces the sell_in of Aged Brie' do
      items = [Item.new("Aged Brie", 20, 0)]
      GildedRose.new(items).update_quality
      expect(items.first.sell_in).to eq 19
    end

    it 'Cannot exceed 50 item quality' do
      items = [Item.new('Aged Brie', 20, 50)]
      
      expect { GildedRose.new(items).update_quality }.to raise_error 'Cannot exceed maximum quality'
    end

  end

  context 'Backstage passes' do
    
    it 'Can set pass quality to 0 when sell_in goes below 0' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 0
    end

    it 'Pass quality increases by 3 a day when sell_in is 5 or less' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 23

      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 26
    end

    it 'Pass quality increases by 2 a day when sell_in between 5 and 10 days' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 22

      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 24
    end

    it 'Reduces the sell_in of passes' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 0)]
      GildedRose.new(items).update_quality
      expect(items.first.sell_in).to eq 19
    end
  end

  context 'Conjured items' do
    it 'Conjured items quality degrades twice as fast as regular' do
      items = [Item.new('Conjured', 10, 10)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 8
    end

    it 'Reduces conjured items sell_in' do
      items = [Item.new('Conjured', 10, 10)]
      GildedRose.new(items).update_quality

      expect(items.first.sell_in).to eq 9
    end
  end

  context 'Sulfuras' do
    it 'Sulfuras does not degrade quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 50)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 50
    end

    it 'Sulfuras does not degrade sell_in' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 50)]
      GildedRose.new(items).update_quality

      expect(items.first.sell_in).to eq 10
    end
  end

end
