class ImageProduct < ApplicationRecord
  belongs_to :product
  belongs_to :image

  validates :image_id , numericality: { only_integer: true}, presence: true
  validates :product_id , numericality: { only_integer: true}, presence: true
end
