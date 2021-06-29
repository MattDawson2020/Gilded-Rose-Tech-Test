require 'item'

describe Item do 
  
  let(:subject) { Item.new('foo', 20, 20) }

  it "Does not change the name" do
    subject.update_quality
    expect(subject.name).to eq 'foo'
  end

  it 'Lets regular items above sell_in degrade normally' do
    subject.update_quality

    expect(subject.quality).to eq 19
  end

  it 'Reduces regular items sell_in' do
    subject.update_quality

    expect(subject.sell_in).to eq 19
  end

  it 'Lets regular items below sell_in degrade faster' do
    aged_item = Item.new('foo', 0, 20)
    aged_item.update_quality

    expect(aged_item.quality).to eq 18
  end

  it 'Cannot exceed 50 item quality' do
    quality_item = Item.new('foo', 10, 50)
    
    expect { quality_item.update_quality }.to raise_error 'Cannot exceed maximum quality'
  end

  it 'Cannot go below 0 item quality' do
    expect { 30.times {subject.update_quality } }.to raise_error 'Item below minimum quality'
  end

  it 'Calculates correctly on repeat updates' do
    expect(subject.quality).to eq 20
    expect(subject.sell_in).to eq 20

    10.times { subject.update_quality }

    expect(subject.quality).to eq 10
    expect(subject.sell_in).to eq 10
  end

end

