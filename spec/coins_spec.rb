require_relative '../models/coins'
require_relative '../models/inventory'

RSpec.describe Coins do
  let(:coins) { Coins.new }
  let(:item) { Inventory.new("water", 0.25, 10)}

  describe "attributes" do
    it "initializes inserted_coin_total as zero" do
      expect(coins.inserted_coin_total).to eq(0)
    end

    it "initializes total_change as zero" do
      expect(coins.total_change).to eq(0)
    end
  end

	describe "#add_coin" do
		it "adds the inserted coin value to the inserted_coin_total" do
			coins.insert_coin(0.25)

      expect(coins.inserted_coin_total).to eq(0.25)
		end
	end

  describe "#reset_totals" do
    it "resets the inserted coin total to zero" do
      coins.insert_coin(0.25)
      coins.reset_totals

      expect(coins.inserted_coin_total).to eq(0)
    end
  end

  describe "#change_due" do
    it "subtracts the item price from the inserted_coin_total" do
      coins.insert_coin(0.50)
      coins.change_due(item)

      expect(coins.total_change).to eq(0.25)
    end
  end
end