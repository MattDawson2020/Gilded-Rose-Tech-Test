require 'aged_brie'
require 'backstage_pass'
require 'conjured_item'
require 'gilded_rose'
require 'item'
require 'sulfuras'

describe GildedRose do
  
  let(:subject) { GildedRose.new([
                                  AgedBrie.new("Aged Brie", 20, 20),
                                  BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 20, 20),
                                  ConjuredItem.new('subject', 20, 20),
                                  Item.new('foo', 20, 20),
                                  Sulfuras.new('Sulfuras, Hand of Ragnaros', 50, 50)
  ])}

  it 'updates the quality of items' do
    subject.update_quality
    expect(subject.items[0].quality).to eq 21
    expect(subject.items[1].quality).to eq 21
    expect(subject.items[2].quality).to eq 18 
    expect(subject.items[3].quality).to eq 19
    expect(subject.items[4].quality).to eq 50 
  end
  
end
