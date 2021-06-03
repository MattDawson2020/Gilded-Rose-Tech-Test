require 'gilded_rose'

describe GildedRose do

  describe "#old_update" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).old_update()
      expect(items[0].name).to eq "foo"
    end
  end

  context "#update_quality" do
    
    it 'increases the quality of Aged Brie' do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 1
    end

    it 'cannot exceed 50 item quality' do
      items = [Item.new("Aged Brie", 0, 50)]
      
      expect { GildedRose.new(items).update_quality }.to raise_error "Cannot exceed maximum quality"
    end


  end

end
