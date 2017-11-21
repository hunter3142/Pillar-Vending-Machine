require_relative 'controllers/vending_controller'

vending = VendingController.new
system "clear"
vending.main_menu