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
end
