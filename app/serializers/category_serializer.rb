class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :subcategories
  has_many :products, through: :subcategories
end
