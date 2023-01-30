class PromoCode < ApplicationRecord
  validates :discount_percentage, presence: true
end
