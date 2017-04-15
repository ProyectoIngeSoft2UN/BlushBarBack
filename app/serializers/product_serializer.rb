class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_id, :cost
end
