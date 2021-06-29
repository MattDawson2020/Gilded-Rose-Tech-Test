class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    check_range
    if self.sell_in <= 0
      self.quality -= 2
    else
      self.quality -= 1
    end
    update_sell_in
  end

  private

  def check_range
    fail 'Cannot exceed maximum quality' if self.quality >= 50
    fail 'Item below minimum quality' if self.quality <= 0
  end

  def update_sell_in
    self.sell_in -= 1
  end

end