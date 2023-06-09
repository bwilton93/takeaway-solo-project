class MenuItem
  def initialize(item_name, price)
    @item_name = item_name
    @price = price
    @available = true
  end

  def name
    return @item_name
  end

  def price
    return @price
  end

  def available?
    return @available
  end

  def toggle_availability
    return @available = !@available
  end

  def format
    fail "item not available" unless self.available?
    return "#{self.name.capitalize()} - £#{self.price}"
  end
end
