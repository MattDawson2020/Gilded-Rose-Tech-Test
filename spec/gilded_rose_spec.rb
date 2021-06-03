require 'gilded_rose'

describe GildedRose do
  
  context '#update_quality' do
    let(:regular_item) { [Item.new('foo', 20, 20)] }

    it "Does not change the name" do
      item = GildedRose.new(regular_item).update_quality
      expect(item.first.name).to eq 'foo'
    end

    it 'Lets regular items above sell_in degrade normally' do
      item = GildedRose.new(regular_item).update_quality

      expect(item.first.quality).to eq 19
    end

    it 'Reduces regular items sell_in' do
      item = GildedRose.new(regular_item).update_quality

      expect(item.first.sell_in).to eq 19
    end

    it 'Lets regular items below sell_in degrade faster' do
      items = [Item.new('foo', 0, 20)]
      GildedRose.new(items).update_quality

      expect(items.first.quality).to eq 18
    end

    it 'Cannot exceed 50 item quality' do
      items = [Item.new('foo', 10, 50)]
      
      expect { GildedRose.new(items).update_quality }.to raise_error 'Cannot exceed maximum quality'
    end

    it 'Cannot go below 0 item quality' do
      item = GildedRose.new(regular_item)

      expect { 30.times {item.update_quality } }.to raise_error 'Item below minimum quality'
    end

    it 'Calculates correctly on repeat updates' do
      repeat_item = GildedRose.new(regular_item)
      expect(repeat_item.items.first.quality).to eq 20
      expect(repeat_item.items.first.sell_in).to eq 20

      10.times { repeat_item.update_quality }

      expect(repeat_item.items.first.quality).to eq 10
      expect(repeat_item.items.first.sell_in).to eq 10
    end

  end

  context 'Aged Brie' do
    let(:aged_brie) { [Item.new("Aged Brie", 20, 20)] }

    it 'Increases the quality of Aged Brie' do
      brie = GildedRose.new(aged_brie).update_quality
      expect(brie.first.quality).to eq 21
    end

    it 'Reduces the sell_in of Aged Brie' do
      brie = GildedRose.new(aged_brie).update_quality
      expect(brie.first.sell_in).to eq 19
    end

    it 'Brie cannot exceed maximum quality' do
      brie = GildedRose.new(aged_brie)

      expect { 31.times { brie.update_quality } }.to raise_error 'Cannot exceed maximum quality'
    end

  end

  context 'Backstage passes' do
    # experimented with declaring a single pass variable and running the method multiple times
    # to simulate repeated updates, but it was ultimately much less clear than just having
    # specific variables to each test

    it 'Reduces the sell_in of passes' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)]
      GildedRose.new(items).update_quality
      expect(items.first.sell_in).to eq 19
    end
    
    it 'Can set pass quality to 0 when sell_in goes below 0' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)]
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

  end

  context 'Conjured items' do
    let(:conjured_item) { [Item.new('Conjured', 20, 20)] }

    it 'Conjured items quality degrades twice as fast as regular' do
      conjured = GildedRose.new(conjured_item).update_quality

      expect(conjured.first.quality).to eq 18
    end

    it 'Reduces conjured items sell_in' do
      conjured = GildedRose.new(conjured_item).update_quality

      expect(conjured.first.sell_in).to eq 19
    end

    it 'Conjured items cannot go below minimum' do
      conjured = GildedRose.new(conjured_item)

      expect { 15.times {conjured.update_quality } }.to raise_error 'Item below minimum quality'
    end
  end

  context 'Sulfuras' do
    let(:sulfuras) { [Item.new('Sulfuras, Hand of Ragnaros', 50, 50)]}

    it 'Sulfuras does not degrade quality' do
      legendary = GildedRose.new(sulfuras).update_quality

      expect(legendary.first.quality).to eq 50
    end

    it 'Sulfuras does not degrade sell_in' do
      legendary = GildedRose.new(sulfuras).update_quality

      expect(legendary.first.sell_in).to eq 50
    end
  end

end
