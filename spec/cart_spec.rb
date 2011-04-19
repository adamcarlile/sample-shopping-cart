require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Checkout" do
  it "Should total £22.45 given FR1, SR1, FR1, FR1, CF1" do
    co = Checkout.new(SUPERMARKET.rules)
    ['FR1', 'SR1', 'FR1', 'FR1', 'CF1'].each do |code|
      co.scan(code)
    end
    co.total.should == "£22.45"
  end
  
  it "Should total £3.11 given FR1, FR1" do
    co = Checkout.new(SUPERMARKET.rules)
    ['FR1', 'FR1'].each do |code|
      co.scan(code)
    end
    co.total.should == "£3.11"
  end
  
  it "Should total £16.11 given SR1, SR1, FR1, SR1" do
    co = Checkout.new(SUPERMARKET.rules)
    ['SR1', 'SR1', 'FR1', 'SR1'].each do |code|
      co.scan(code)
    end
    co.total.should == "£16.61"
  end
  
end
