class Checkout
  
  attr_accessor :basket, :price_rules
  
  def initialize(rules)
    @basket = []
    @rules = rules
  end
  
  def scan(item)
    product = SUPERMARKET.products.find {|x| x.code == item}.dup
    @basket << product
  end
  
  def gross_total
    price = @basket.map {|x| x.price}
    price.inject{|x,y| x+y}
  end
  
  def net_total
    apply_rules
    gross_total
  end
  
  def total
    "£" + net_total.to_s
  end
  
  def apply_rules
    @rules.each do |rule|
      rule.send(rule.method.to_sym, basket)
    end
  end

end