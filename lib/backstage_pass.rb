require 'item'

class BackStagePass < Item

  def update_quality
    check_range
    if self.sell_in <= 0
      self.quality = 0
    elsif self.sell_in <= 5
      self.quality += 3
    elsif self.sell_in.between?(5,10)
      self.quality += 2
    else
      self.quality += 1
    end
    update_sell_in
  end

end