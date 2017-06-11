require_relative 'rule'
class Rules
  def initialize
    @rules = Array.new
  end

  def add(rule)
    @rules << rule
  end

  def bill_for(item, item_count)
    item_rule = get_item_rule(item)

    if !item_rule.has_special_price?
      return item_count * item_rule.price
    end

    items_with_out_discount = item_count % item_rule.items_count
    items_with_out_discount_price = items_with_out_discount * item_rule.price

    items_with_discount = item_count - items_with_out_discount
    items_with_discount_price = (items_with_discount / item_rule.items_count) * item_rule.special_price

    items_with_out_discount_price + items_with_discount_price
  end

  private

  def get_item_rule(item)
    @rules.find { |rule| rule.item.equal?(item) }
  end
end