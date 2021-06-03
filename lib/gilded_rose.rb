require_relative 'items'

class GildedRose

  def initialize(items)
    @items = items
  end

  def old_update()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end


  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        check_range(item) 
        increase_quality(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        check_range(item) 
        update_pass(item)
      elsif item.name == 'Sulfuras, Hand of Ragnaros'
        next
      elsif item.name == "Conjured"
        check_range(item) 
        2.times { update_regular(item) }
      else
        check_range(item) 
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

