require_relative 'inventory'
require_relative 'coins'

class Vending
	attr_reader :current_display, :coins, :cola, :chips, :candy

	def initialize
		@current_display = "INSERT COIN"
		@coins = Coins.new
    	@cola = Inventory.new("Cola", 1.00, 10)
    	@chips = Inventory.new("Chips", 0.50, 10)
    	@candy = Inventory.new("Candy", 0.65, 10)
	end

	def coin_total(coinage)
		@current_display = "Money Entered: $#{'%.02f' % coinage.inserted_coin_total}"
	end

	def dispense_product(item, coinage)
		if item.inventory_count == 0
      		@current_display = "SOLD OUT"
    	elsif coinage.inserted_coin_total == item.price
      		@current_display =  "Dispensed: #{item.name}"
    	elsif coinage.inserted_coin_total > item.price
    		coinage.change_due(item)
      		@current_display = "Dispensed: #{item.name} | Change: $#{'%.02f' % coinage.change_due(item)}"
    	else
      		@current_display = "Price: $#{'%.02f' % item.price}"
    	end
	end

	def coin_return(coinage)
		@current_display = "Returned: $#{coinage.inserted_coin_total}"
	end

	def display_reset(coinage)
		if coinage.inserted_coin_total > 0
			coin_total(coinage)
		else
			@current_display = "INSERT COIN"
		end
	end
end