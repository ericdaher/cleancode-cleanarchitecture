require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should not create product without description' do
    product = Product.new
    assert_not product.save
  end

  test 'should not create product without price' do
    product = Product.new(description: 'description')
    assert_not product.save
  end

  test 'should not create product without quantity' do
    product = Product.new(description: 'description', price: 10.0)
    assert_not product.save
  end

  test 'should create product with description, price and quantity' do
    product = Product.new(description: 'description', price: 10.0, quantity: 3)
    assert product.save
  end
end
