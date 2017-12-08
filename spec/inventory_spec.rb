require_relative '../models/inventory'

RSpec.describe Inventory do 
	let(:item) { Inventory.new("water", 0.25, 10) }

  	describe "attributes" do
    	it "responds to name" do
      		expect(item).to respond_to(:name)
    	end

    	it "reports its name" do
      		expect(item.name).to eq("water")
    	end

    	it "responds to price" do
      		expect(item).to respond_to(:price)
    	end

    	it "reports its price" do
      		expect(item.price).to eq(0.25)
    	end

    	it "responds to count" do
      		expect(item).to respond_to(:inventory_count)
    	end

    	it "reports its count" do
      		expect(item.inventory_count).to eq(10)
    	end
  	end

  	describe "#remove_item" do
    	it "removes only one item from the given iventory" do
      		item.remove_item

      		expect(item.inventory_count).to eq(9)
    	end
  	end
end