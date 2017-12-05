require_relative '../models/displays'
require_relative '../models/coins'
require_relative '../models/inventory'

RSpec.describe Displays do
	let(:displays) { Displays.new }
  let(:coins) { Coins.new }
  let(:item) { Inventory.new("Water", 0.25, 1) }

	describe "attributes" do 
		it "initializes current_display as INSERT COIN" do
      expect(displays.current_display).to eq("INSERT COIN")
    end
	end

  describe "#coin_total" do
    it "displays the current coin total" do
      coins.insert_coin(0.25)
      displays.coin_total

      expect(displays.current_display).to eq("$0.25")
    end
  end

  describe "#dispense_product" do
    it "displays the selected product if coin total equals price" do
      coins.insert_coin(0.25)
      displays.dispense_product(item)

      expect(displays.current_display).to eq("Dispensed: Water")
    end
    it "displays the selected product and change due if coin total is greater than price" do
      coins.insert_coin(0.50)
      displays.dispense_product(item)

      expect(displays.current_display).to eq("Dispensed: Water | Change: $0.25")
    end
    it "displays the price of the product if coin total is less than price" do
      coins.insert_coin(0.10)
      displays.dispense_product(item)

      expect(displays.current_display).to eq("Price: $0.25")
    end
    it "displays SOLD OUT if the selected product has an inventory of zero" do
      item.remove_item
      displays.dispense_product(item)

      expect(displays.current_display).to eq("SOLD OUT")
    end
  end

  describe "#coin_return" do
    it "displays the amount returned" do
      coins.insert_coin(0.25)
      displays.coin_return

      expect(displays.current_display).to eq("Returned: $0.25")
    end
  end

  describe "#display_reset" do
    it "resets current_display to INSERT COIN when coin total is zero" do
      displays.display_reset

      expect(displays.current_display).to eq("INSERT COIN")
    end
    it "resets current_display to coin total when coin total is greater than zero" do
      coins.insert_coin(0.25)
      displays.display_reset

      expect(displays.current_display).to eq("$0.25")
    end
  end
end