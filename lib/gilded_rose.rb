require 'aged_brie'
require 'backstage_pass'
require 'conjured_item'
require 'gilded_rose'
require 'item'
require 'sulfuras'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_quality
    end
  end

end
