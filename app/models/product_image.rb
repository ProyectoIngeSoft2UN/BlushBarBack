class ProductImage < ApplicationRecord
  belongs_to :product
  belongs_to :image

  validates :product, :image, presence: true
end
