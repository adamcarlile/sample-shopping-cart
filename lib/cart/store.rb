class Store
  
  attr_accessor :products, :rules
  
  def initialize(products, rules)
    @products = generate_product_objects(products)
    @rules = generate_price_rules(rules)
  end
  
  private
  
    def generate_product_objects(products)
      raise ArgumentError unless products.is_a? Array
      array = []
      products.each do |product|
        array << Product.new(product[:code], product[:name], product[:price])
      end
      return array
    end
    
    def generate_price_rules(rules)
      raise ArgumentError unless rules.is_a? Array
      array = []
      rules.each do |rule|
        array << Rule.new(rule[:code], rule[:method], rule[:options])
      end
      return array
    end
  
end