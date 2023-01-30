require 'test_helper'

class PromoCodeTest < ActiveSupport::TestCase
  test 'should not create promo_code without discount_percentage' do
    promo_code = PromoCode.new
    assert_not promo_code.save
  end

  test 'should create promo_code with discount_percentage' do
    promo_code = PromoCode.new(discount_percentage: 10.0)
    assert promo_code.save
  end
end
