require_relative '../models/coins'

RSpec.describe Coins do
  let(:coins) { Coins.new }

  describe "attributes" do
    it "initializes inserted_coin_total as zero" do
      expect(coins.inserted_coin_total).to eq(0)
    end
  end

	describe "#add_coin" do
		it "adds the inserted coin value to the inserted_coin_total" do
			coins.insert_coin(0.25)

      expect(coins.inserted_coin_total).to eq(0.25)
		end
	end

  describe "#reset_total" do
    it "resets the inserted coin total to zero" do
      coins.insert_coin(0.25)
      coins.reset_total

      expect(coins.inserted_coin_total).to eq(0)
    end
  end
end