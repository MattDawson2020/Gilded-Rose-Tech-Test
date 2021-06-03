require_relative 'items'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      check_range(item) unless item.name == "Sulfuras, Hand of Ragnaros"
      if item.name == "Aged Brie"
        increase_quality(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_pass(item)
      elsif item.name == 'Sulfuras, Hand of Ragnaros'
        next
      elsif item.name == "Conjured"
        2.times { update_regular(item) }
      else
        update_regular(item)
      end
      item.sell_in -= 1 
    end
  end

  private 

  def increase_quality(item)
    item.quality += 1
  end

  def update_pass(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in.between?(5,10)
      item.quality += 2
    end
  end

  def update_regular(item)
    if item.sell_in <= 0
      item.quality -= 2
    else
      item.quality -= 1
    end
  end

  def check_range(item)
    fail 'Cannot exceed maximum quality' if item.quality >= 50
    fail 'Item below minimum quality' if item.quality <= 0
  end

end

