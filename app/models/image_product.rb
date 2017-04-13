class ImageProduct < ApplicationRecord
  belongs_to :product
  belongs_to :image

  def self.get_images_products(page,per_page)
    select(:product_id,:image_id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_images_of(id)
    select(:image_id).where(product_id: id)
  end

  def self.get_products_of(id)
    select(:product_id).where(image_id: id)
  end
end
