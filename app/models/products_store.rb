class ProductsStore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product, :store, presence: true
end
