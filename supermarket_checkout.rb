require_relative 'rules'
require_relative 'rule'
class SupermarketCheckout

  def initialize(rules)
    @rules = rules
    @total = 0
    @items_list = Hash.new(0)
  end

  def scan(item)
    item_symbol = item.to_sym

    @items_list[item_symbol] += 1
  end

  def total
    @items_list.each_pair do |item, items_count|
      @total += @rules.bill_for(item, items_count)
    end

    @total
  end
end
