require 'item'

class ConjuredItem < Item

  def update_quality
    check_range
    if self.sell_in <= 0
      self.quality -= 4
    else
      self.quality -= 2
    end
    update_sell_in
  end

end