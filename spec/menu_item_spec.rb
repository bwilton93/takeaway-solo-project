require 'menu_item'

RSpec.describe MenuItem do
  context "initially" do
    it "builds with correct information" do
      menu_item = MenuItem.new("noodles", 1)
      expect(menu_item.name).to eq "noodles"
      expect(menu_item.price).to eq 1
    end
  end
end