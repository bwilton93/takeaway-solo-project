require 'menu'
require 'menu_item'
require 'formatter'
require 'order_confirmation'

RSpec.describe "integration" do
  it "adds and lists menu items" do
    menu = Menu.new
    item_1 = MenuItem.new("noodles", 1)
    item_2 = MenuItem.new("soup", 1.5)
    menu.add(item_1)
    menu.add(item_2)
    expect(menu.all).to eq [item_1, item_2]
  end

  it "shows only available dishes on the menu" do
    menu = Menu.new
    item_1 = MenuItem.new("noodles", 1)
    item_2 = MenuItem.new("soup", 1.5)
    menu.add(item_1)
    menu.add(item_2)
    item_1.toggle_availability
    expect(menu.show_available).to eq [item_2]
  end

  it "formats an available dish" do
    menu = Menu.new
    item_1 = MenuItem.new("noodles", 1)
    formatter = Formatter.new(item_1)
    expect(formatter.format).to eq "Noodles - £1"
  end
  
  it "doesn't format a dish that has been made unavailable" do
    menu = Menu.new
    item_1 = MenuItem.new("noodles", 1)
    formatter = Formatter.new(item_1)
    item_1.toggle_availability
    expect{ formatter.format }.to raise_error "item not available"
  end
end
