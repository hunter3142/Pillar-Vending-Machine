require_relative '../models/vending'
require_relative '../models/coins'
require_relative '../models/inventory'

RSpec.describe Vending do
	let(:vending) { Vending.new }
	let(:coins) { Coins.new }
	let(:item) { Inventory.new(1, "Water", 0.25, 1) }

	describe "attributes" do 
		it "initializes current_display as INSERT COIN" do
      		expect(vending.current_display).to eq("INSERT COIN")
    	end
	end

	describe "#main_menu" do
		it "displays the menu and the current_display" do
			expect(vending.main_menu).to output("__________Time for some goodies!__________\n 
										>> Allowed Coins: Quarter, Dime, Nickel <<\n
										1=> Cola(10): $1.00\n
										2=> Chips(10): $0.50\n
										3=> Candy(10): $0.65\n
										INSERT COIN\n")	
		end
	end

	describe "#parse_input" do
		it "determines whether the input is an integer and runs dispense_product" do
			expect(vending.parse_input(1)).to receive(:dispense_product).with(item)
		end

		it "determines whether the integer is invalid" do
			vending.parse_input(4)

			expect(vending.current_display).to eq("INVALID INPUT")
		end

		it "determines whether the input is a string and runs insert_coin" do
			expect(vending.parse_input("quarter")).to receive(:insert_coin).with("quarter")
		end

		it "determines if the string input is invalid" do
			vending.parse_input("invalid")

			expect(vending.current_display).to eq("INVALID INPUT")
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