require_relative '../models/displays'

class VendingController
	attr_reader :displays

	def initialize 
		@displays = Displays.new
	end

	def main_menu
		puts "Cola: $1.00"
		puts "Chips: $0.50"
		puts "Candy: $0.65"
    print "#{displays.current_display}\n"

    inserted_coin = gets
	end
end