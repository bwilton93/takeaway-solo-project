class MenuItem
  def initialize(item_name, price)
    @item_name = item_name
    @price = price
  end

  def name
    return @item_name
  end

  def price
    return @price
  end
end