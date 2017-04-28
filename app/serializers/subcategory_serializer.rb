class SubcategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_id
  belongs_to :category
  has_many :products
end
