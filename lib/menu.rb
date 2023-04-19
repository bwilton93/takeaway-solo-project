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
    return @selected_items
  end
  
  def show_available
    return @menu.filter { |item| item.available? }
  end
end
