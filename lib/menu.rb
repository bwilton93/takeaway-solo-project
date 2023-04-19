class Menu
  def initialize
    @menu = []
    @selected_items = []
  end

  def add(menu_item)
    @menu << menu_item
  end

  def all
    return @menu
  end

  def choose_item(search_word)
    return @menu.filter do |item| 
      if item.name == search_word
        @selected_items << item
      end
    end
  end

  def show_selected
    return @selected_items.map { |item| item.format }
  end

  def show_receipt
    receipt = []
    receipt << show_selected
    total_price = @selected_items.map { |item| item.price }.inject(:+)
    receipt << total_price
  end
  
  def show_available
    available_items = @menu.filter { |item| item.available? } 

    return available_items.map { |item| item.format }
  end
end
