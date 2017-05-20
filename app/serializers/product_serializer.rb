class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :subcategory_id, :cost, :brand
  belongs_to :subcategory
  has_many :stockstores
  has_many :references
  has_many :bills
  has_many :images
end
