class Formatter
  def initialize(item)
    @item = item
  end

  def format
    fail "item not available" unless @item.available?
    return "#{@item.name.capitalize()} - £#{@item.price}"
  end
end
