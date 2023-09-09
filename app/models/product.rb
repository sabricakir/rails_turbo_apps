class Product < ApplicationRecord
  has_many :product_prices, dependent: :destroy
  has_one :post, dependent: :destroy
end
