class ProductPrice < ApplicationRecord
  belongs_to :product

  validates :cost, presence: true
end
