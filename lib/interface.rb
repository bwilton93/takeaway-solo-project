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

    @io.puts "Hello, welcome to City Wok"
    @io.puts border
    while true
      user_selection
    end
  end

  def output_choices
    return "What would you like to do?\n1. Look at menu\n2. Add item to selection\n3. Look at selection\n4. Confirm order\n5. Cancel order"
  end

  def user_selection
    empty_order = "No items selected yet"

    @io.puts output_choices
    @io.puts border
    input = @io.gets.chomp
    @io.puts border
    case input
    when "1"
      @io.puts show_menu
    when "2"
      @io.puts "Choose your item"
      input = @io.gets.chomp
      item = add_selection(input)
      if item.is_a? String
        @io.puts item
      end
    when "3"
      if !@menu.show_selected.empty?
        @io.puts look_at_selection
      else
        @io.puts empty_order
      end
    when "4"
      if !@menu.show_selected.empty?
        submit_order
      else
        @io.puts empty_order
      end
    when "5"
      @io.puts "Order cancelled"
      exit
    else
      @io.puts "Invalid selection"
      user_selection
    end
    @io.puts border
  end

  def show_menu
    return @menu.show_available
  end

  def add_selection(item)
    return @menu.choose_item(item)
  end

  def look_at_selection
    return @menu.show_selected
  end

  def submit_order
    order_confirmer = OrderConfirmation.new
    @io.puts look_at_selection
    @io.puts "Is this correct?"
    input = @io.gets.chomp
    if input == "yes"
      @io.puts "Please enter your phone number"
      input = @io.gets.chomp
      order_confirmer.send_message(input)
      exit
    else
      return
    end
  end

  def border
    return "-" * 50
  end
end

interface = UserInterface.new
interface.run
