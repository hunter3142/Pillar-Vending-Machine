class Inventory
  attr_accessor :name, :price, :inventory_count

  def initialize(name, price, inventory_count)
    @name = name
    @price = price
    @inventory_count = inventory_count
  end

  def remove_item
  	self.inventory_count -= 1
  end
end

