class Rule
  
  attr_accessor :code, :method
  
  def initialize(code, method, options={})
    default_options = {:price => 0.0}
    @options = default_options.update(options)
    @code = code
    @method = method
  end
  
  
  # This could do to be rewritten to support a more flexible methodology
  # Currently new rule type logic will have to be added here, but the rules are defined in the YML file
  def buy_one_get_one_free(basket)
    matches = 0
    basket.each do |product|
      if product.code == code
        matches += 1 
        if matches.even?
          product.price = 0.0
        end
      end
    end
  end
  
  def bulk_discount(basket)
    matches = 0
    reset_price = false
    basket.each do |product|
      if product.code == code
        matches += 1
        if matches >= @options[:threshold]
          reset_price = true
        end
      end
    end
    basket.select{|x| x.code == code}.each{|x| x.price = @options[:price]} if reset_price
  end 
    
end