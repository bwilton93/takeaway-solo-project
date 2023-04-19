require 'menu_item'

RSpec.describe MenuItem do
  context "initially" do
    it "builds with correct information" do
      menu_item = MenuItem.new("noodles", 1)
      expect(menu_item.name).to eq "noodles"
      expect(menu_item.price).to eq 1
    end
  end

  context "available?" do
    it "returns true if dish available" do
      menu_item = double :item, available?: true
      expect(menu_item.available?).to eq true
    end

    it "returns false if dish toggled to unavailable" do
      menu_item = MenuItem.new("noodles", 1)
      menu_item.toggle_availability
      expect(menu_item.available?).to eq false
    end
    
    it "returns true if dish made available again" do
      menu_item = MenuItem.new("noodles", 1)
      menu_item.toggle_availability
      menu_item.toggle_availability
      expect(menu_item.available?).to eq true
    end
  end
end
