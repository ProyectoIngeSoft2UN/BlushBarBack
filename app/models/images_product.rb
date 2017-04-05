class ImagesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :image

  validates :product, :image, presence: true

  def self.get_images(id)
    select(:image_id).where(product_id: id)
  end

  def self.get_produc(id)
    select(:product_id).where(image_id: id)
  end
end
