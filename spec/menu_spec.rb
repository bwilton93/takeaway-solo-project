require 'menu'

RSpec.describe Menu do
  context "initially" do
    it "creates an empty list" do
      menu = Menu.new
      expect(menu.all).to eq []
    end
  end

  describe "#add" do
    it "allows multiple items to be added to the menu" do
      menu = Menu.new
      item_1 = double :item
      item_2 = double :item
      menu.add(item_1)
      menu.add(item_2)
      expect(menu.all).to eq [item_1, item_2]
    end
  end

  describe "#show_available" do
    it "shows a list of all available dishes" do
      menu = Menu.new
      item_1 = double :item, name: "noodles", 
        price: 1, available?: true
      item_2 = double :item, available?: false
      menu.add(item_1)
      menu.add(item_2)
      expect(item_1).to receive(:format).and_return("Noodles - £1")
      expect(menu.show_available).to eq ["Noodles - £1"]
    end
  end
  
  describe "#select_items" do
    it "allows the customer to select a dish" do
      menu = Menu.new
      item_1 = double :item, name: "noodles"
      item_2 = double :item, name: "soup"
      menu.add(item_1)
      menu.add(item_2)
      expect(menu.choose_item("noodles")).to eq [item_1]
    end
  end

  describe "#show_selected" do
    it "allows the user to see all their currently selected items" do
      menu = Menu.new
      item_1 = double :item, name: "noodles", price: 1
      item_2 = double :item, name: "soup", price: 1.5
      item_3 = double :item, name: "chips", price: 1.2
      menu.add(item_1)
      menu.add(item_2)
      menu.add(item_3)
      menu.choose_item("noodles")
      menu.choose_item("soup")
      allow(item_1).to receive(:format).and_return("Noodles - £1")
      allow(item_2).to receive(:format).and_return("Soup - £1.5")
      expect(menu.show_selected).to eq [
        "Noodles - £1",
        "Soup - £1.5"
      ]
    end
  end
end
