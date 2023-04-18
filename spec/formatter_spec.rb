require 'formatter'

RSpec.describe Formatter do
  it "raises error when trying to format an unavailable dish" do
    item = double :item, 
      name: "noodles", available?: false
    menu_formatter = Formatter.new(item)
    expect{ menu_formatter.format }.to raise_error "item not available"
  end

  it "formats an available dish" do
    item = double :item,
      name: "noodles", price: 1, available?: true
    menu_formatter = Formatter.new(item)
    expect(menu_formatter.format).to eq "Noodles - £1"
  end
end
