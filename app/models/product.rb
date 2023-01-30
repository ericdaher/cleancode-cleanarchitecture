class Product < ApplicationRecord
  validates :description, :price, :quantity, presence: true
end
