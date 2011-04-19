require 'cart/checkout'
require 'cart/product'
require 'cart/store'
require 'cart/rule'
require 'yaml'

SUPERMARKET = Store.new(YAML::load(File.open('data/products.yml'))[:products], YAML::load(File.open('data/rules.yml'))[:rules])