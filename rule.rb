class Rule
  attr_reader :item
  attr_reader :price
  attr_reader :items_count
  attr_reader :special_price

  def initialize(item, price)
    @item = item
    @price = price
    @has_special_price = false
  end

  def add_special_price(items_count, special_price)
    @has_special_price = true

    @items_count = items_count
    @special_price = special_price

    self
  end

  def has_special_price?
    @has_special_price
  end
end