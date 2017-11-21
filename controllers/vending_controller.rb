require_relative '../models/displays'
require_relative '../models/coins'

class VendingController
	attr_reader :displays
	attr_reader :coins

	def initialize 
		@displays = Displays.new
		@coins = Coins.new
	end

	def main_menu
    puts "__________Time for some goodies!__________"
    puts ">> Allowed Coins: Quarter, Dime, Nickel <<"
		puts "              1=> Colas: $1.00"
		puts "              2=> Chips: $0.50"
		puts "              3=> Candy: $0.65"
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
      else
        system "clear"
        print "              Invalid Coin\n"
        system "sleep 1"
        system "clear"
        main_menu
    end 
	end
end