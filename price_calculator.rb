
require_relative 'supermarket_checkout'
class PriceCalculator

  def get_rules
    rules = Rules.new
    rules.add(Rule.new(:milk, 3.97).add_special_price(2, 5.00))
    rules.add(Rule.new(:bread, 2.17).add_special_price(3, 6.00))
    rules.add(Rule.new(:banana, 0.99))
    rules.add(Rule.new(:apple, 0.89))

    rules
  end                  
  def total(items)
    supermarket_checkout = SupermarketCheckout.new(get_rules)

    items.split(',').each { |item| supermarket_checkout.scan(item) }

    supermarket_checkout.total
  end
  puts "Please enter all listed items ['Milk','Bread','Apple','Banana'] purchased separated by a comma"
  
  list = gets.chomp
  li = []
  list.split(',').each do |l|
    li << l.strip.downcase if ['milk','bread','apple','banana'].include?(l.strip.downcase) 
  end
 
  pc = PriceCalculator.new
  puts pc.total(li.join(','))                  
end