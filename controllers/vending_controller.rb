require_relative '../models/displays'
require_relative '../models/coins'
require_relative '../models/inventory'

class VendingController
	attr_reader :displays
	attr_reader :coins
  attr_reader :inventory

	def initialize 
		@displays = Displays.new
		@coins = Coins.new
    @cola = Inventory.new("Cola", 1.00, 10)
    @chips = Inventory.new("Chips", 0.50, 10)
    @candy = Inventory.new("Candy", 0.65, 10)
	end

	def main_menu
    puts "__________Time for some goodies!__________"
    puts ">> Allowed Coins: Quarter, Dime, Nickel <<"
		puts "           1=> #{@cola.name}(#{@cola.inventory_count}): $#{'%.02f' % @cola.price}"
		puts "           2=> #{@chips.name}(#{@chips.inventory_count}): $#{'%.02f' % @chips.price}"
		puts "           3=> #{@candy.name}(#{@candy.inventory_count}): $#{'%.02f' % @candy.price}"
    if coins.inserted_coin_total == 0
      print "#{displays.current_display}\n"
    elsif coins.inserted_coin_total > 0 
      print "Money Entered: $#{'%.02f' % coins.inserted_coin_total}\n"
    end

    user_input = gets.chomp.downcase

    case user_input
# >>>>>>>>>>_____FOR COIN INPUTS_____
      when "quarter"
        system "clear"
        coins.insert_coin(0.25)
        main_menu
      when "dime"
        system "clear"
        coins.insert_coin(0.1)
        main_menu
      when "nickel"
        system "clear"
        coins.insert_coin(0.05)
        main_menu
# >>>>>>>>>>_____FOR ITEM INPUTS_____
      when "1"
        item_output(@cola)
      when "2"
        item_output(@chips)
      when "3"
        item_output(@candy)
# >>>>>>>>>>_____FOR INVALID INPUT_____
      else
        system "clear"
        print "           Invalid Coin/Item Number\n"
        system "sleep 1"
        system "clear"
        main_menu
    end
	end
# >>>>>>>>>>_____ITEM OUTPUTS_____
  def item_output(item)
    if (coins.inserted_coin_total == item.price)
      system "clear"
      item.remove_item
      @coins.reset_totals
      puts "              THANK YOU\n"
      puts "           Dispensed: #{item.name}"
      system "sleep 1"
      system "clear"
      main_menu
    elsif (coins.inserted_coin_total > item.price)
      system "clear"
      item.remove_item
      @coins.change_due(item)
      puts "              THANK YOU\n"
      puts "           Dispensed: #{item.name}"
      puts "           Change: $#{'%.02f' % coins.total_change}"
      system "sleep 1.5"
      system "clear"
      @coins.reset_totals
      main_menu
    else
      system "clear"
      print "              Price: $#{'%.02f' % item.price}\n"
      system "sleep 1"
      system "clear"
      main_menu
    end
  end
end