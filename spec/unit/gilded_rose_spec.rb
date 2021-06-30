require 'aged_brie'
require 'backstage_pass'
require 'conjured_item'
require 'gilded_rose'
require 'item'
require 'sulfuras'

describe GildedRose do
  
  let(:item_double) { double(:item, name:"fake brie", sell_in: 20, quality: 20)}

  let(:subject) { GildedRose.new([item_double])}

  it 'updates the quality of items' do
    expect(subject).to receive(:update_quality)
    subject.update_quality
  end
  
end
