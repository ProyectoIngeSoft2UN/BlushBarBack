class ImageProduct < ApplicationRecord
  belongs_to :image
  belongs_to :product

  validates :product, :image, presence: true
end
