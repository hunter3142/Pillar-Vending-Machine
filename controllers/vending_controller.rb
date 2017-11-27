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
    @colas = Inventory.new("Cola", 1.00, 10)
    @chips = Inventory.new("Chips", 0.50, 10)
    @candy = Inventory.new("Candy", 0.65, 10)
	end

	def main_menu
    puts "__________Time for some goodies!__________"
    puts ">> Allowed Coins: Quarter, Dime, Nickel <<"
		puts "           1=> #{@colas.name}(#{@colas.inventory_count}): $#{'%.02f' % @colas.price}"
		puts "           2=> #{@chips.name}(#{@chips.inventory_count}): $#{'%.02f' % @chips.price}"
		puts "           3=> #{@candy.name}(#{@candy.inventory_count}): $#{'%.02f' % @candy.price}"
    if coins.inserted_coin_total == 0
      print "#{displays.current_display}\n"
    elsif coins.inserted_coin_total > 0 
      print "Money Entered: $#{'%.02f' % coins.inserted_coin_total}\n"
    end

    inserted_coin = gets.chomp.downcase

    case inserted_coin
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
      when "1"
        if (coins.inserted_coin_total >= @colas.price)
          system "clear"
          @colas.remove_item
          @coins.reset_total
          puts "              THANK YOU\n"
          puts "           Dispensed: #{@colas.name}"
          system "sleep 1"
          system "clear"
          main_menu
        else
          system "clear"
          print "              Price: $#{'%.02f' % @colas.price}\n"
          system "sleep 1"
          system "clear"
          main_menu
        end
      when "2"
        if (coins.inserted_coin_total >= @chips.price)
          system "clear"
          @chips.remove_item
          @coins.reset_total
          print "              THANK YOU\n"
          puts "           Dispensed: #{@chips.name}"
          system "sleep 1"
          system "clear"
          main_menu
        else
          system "clear"
          print "              Price: $#{'%.02f' % @chips.price}\n"
          system "sleep 1"
          system "clear"
          main_menu
        end
      when "3"
        if (coins.inserted_coin_total >= @candy.price)
          system "clear"
          @candy.remove_item
          @coins.reset_total
          print "              THANK YOU\n"
          puts "           Dispensed: #{@candy.name}"
          system "sleep 1"
          system "clear"
          main_menu
        else
          system "clear"
          print "              Price: $#{'%.02f' % @candy.price}\n"
          system "sleep 1"
          system "clear"
          main_menu
        end
      else
        system "clear"
        print "           Invalid Coin/Item Number\n"
        system "sleep 1"
        system "clear"
        main_menu
    end 
	end
end