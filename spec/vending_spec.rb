require_relative '../models/vending'
require_relative '../models/coins'
require_relative '../models/inventory'

RSpec.describe Vending do
	let(:vending) { Vending.new }
	let(:coins) { Coins.new }
	let(:item) { Inventory.new("Water", 0.25, 1) }

	describe "attributes" do 
		it "initializes current_display as INSERT COIN" do
      		expect(vending.current_display).to eq("INSERT COIN")
    	end
	end

  	describe "#coin_total" do
    	it "display the current coin total" do
    		coins.insert_coin(0.25)
      		vending.coin_total(coins)

      		expect(vending.current_display).to eq("Money Entered: $0.25")
    	end
  	end

  	describe "#dispense_product" do
    	it "display the selected product if coin total equals price" do
      		coins.insert_coin(0.25)
      		vending.dispense_product(item, coins)

      		expect(vending.current_display).to eq("Dispensed: Water")
    	end

    	it "display the selected product and change due if coin total is greater than price" do
      		coins.insert_coin(0.50)
      		vending.dispense_product(item, coins)

      		expect(vending.current_display).to eq("Dispensed: Water | Change: $0.25")
    	end

    	it "display the price of the product if coin total is less than price" do
      		coins.insert_coin(0.10)
      		vending.dispense_product(item, coins)

      		expect(vending.current_display).to eq("Price: $0.25")
    	end

    	it "display SOLD OUT if the selected product has an inventory of zero" do
      		item.remove_item
      		vending.dispense_product(item, coins)

      		expect(vending.current_display).to eq("SOLD OUT")
    	end
  	end

  	describe "#coin_return" do
    	it "display the amount returned" do
      		coins.insert_coin(0.25)
      		vending.coin_return(coins)

      		expect(vending.current_display).to eq("Returned: $0.25")
    	end
  	end

  	describe "#display_reset" do
    	it "resets current_display to INSERT COIN when coin total is zero" do
      		vending.display_reset(coins)

      		expect(vending.current_display).to eq("INSERT COIN")
    	end

    	it "resets current_display to coin total when coin total is greater than zero" do
      		coins.insert_coin(0.25)
      		vending.display_reset(coins)

      		expect(vending.current_display).to eq("Money Entered: $0.25")
    	end
  	end
end