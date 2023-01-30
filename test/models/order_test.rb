require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'should not save order without user_cpf' do
    order = Order.new
    assert_not order.save
  end

  test 'should not save order with user_cpf with bad formatting' do
    order = Order.new(user_cpf: '123456789---12')
    assert_not order.save
    assert_includes order.errors[:user_cpf], 'format is invalid; please use XXX.XXX.XXX-XX'
  end

  test 'should not save order with invalid user_cpf' do
    order = Order.new(user_cpf: '123.456.789-10')
    assert_not order.save
    assert_includes order.errors[:user_cpf], 'cpf is invalid'
  end

  test 'should save order with valid user_cpf' do
    order = Order.new(user_cpf: '660.633.165-07')
    assert order.save
  end

  test 'should save order with 3 items' do
    products = (1..3).map { |i| Product.create(description: 'description', price: 10.0, quantity: 3) }
    order = Order.new(user_cpf: '660.633.165-07', products: products)
    assert order.save
  end

  test 'should save order with promocode' do
    promo_code = PromoCode.create
    order = Order.new(user_cpf: '660.633.165-07', promo_code: promo_code)
    assert order.save
  end
end
