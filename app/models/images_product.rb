class ImagesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :image

  validates :product, :image, presence: true

  def self.get_imagesproducts(page = 1, per_page = 10)
    select(:image_id,:product_id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_images(id)
    includes(:image).where(product_id: id)
  end

  def self.get_produc(id)
    includes(:product).where(image_id: id)
  end
end
