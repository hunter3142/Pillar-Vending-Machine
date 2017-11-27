class Coins
	attr_reader :inserted_coin_total

	def initialize
		@inserted_coin_total = 0
	end

  def insert_coin (inserted_coin)
    @inserted_coin_total += inserted_coin
  end

  def reset_total
  	@inserted_coin_total = 0
  end
end