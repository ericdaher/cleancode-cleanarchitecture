class Order < ApplicationRecord
  has_many :products
  has_one :promo_code

  validates :user_cpf, presence: true, cpf: true
end
