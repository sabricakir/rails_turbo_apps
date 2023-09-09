class PostPrice < ApplicationRecord
  belongs_to :post

  validates :cost, presence: true
end
