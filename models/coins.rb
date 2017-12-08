require_relative 'inventory'

class Coins
	attr_accessor :inserted_coin_total, :total_change

	def initialize
		@inserted_coin_total = 0
		@total_change = 0
	end

  	def insert_coin (inserted_coin)
    	@inserted_coin_total += inserted_coin
  	end

  	def reset_totals
  		@inserted_coin_total = 0
  		@total_change = 0
  	end

  	def change_due(item)
  		@total_change = inserted_coin_total - item.price
  	end
end