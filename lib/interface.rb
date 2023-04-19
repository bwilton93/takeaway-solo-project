require './menu.rb'
require './order_confirmation.rb'
require './menu_item.rb'

class UserInterface
  def initialize(io = Kernel)
    @io = io
    @menu = Menu.new
  end
  
  def run
    menu_items = [MenuItem.new("noodles", 1), MenuItem.new("soup", 1.5)]
    menu_items.each do |item|
      @menu.add(item)
    end

    puts "Hello, welcome to City Wok\nWhat would you like to do?"
    puts output_choices
  end

  def output_choices
    return "1. Look at menu\n2. Add item to selection\n3. Look at selection\n4. Confirm order"
  end
end



interface = UserInterface.new
interface.run