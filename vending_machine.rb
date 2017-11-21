require_relative 'controllers/vending_controller'

vending = VendingController.new
system "clear"
puts "Time for some goodies!"
vending.main_menu