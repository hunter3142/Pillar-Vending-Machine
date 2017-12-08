class Inventory
  attr_accessor :item_number, :name, :price, :inventory_count

  def initialize(item_number, name, price, inventory_count)
  	@item_number = item_number
    @name = name
    @price = price
    @inventory_count = inventory_count
  end

  def remove_item
  	self.inventory_count -= 1
  end
end

