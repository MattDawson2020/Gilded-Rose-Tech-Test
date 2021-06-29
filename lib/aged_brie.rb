require 'item'

class AgedBrie < Item

  def update_quality
    check_range
    self.quality += 1
    update_sell_in
  end

end