class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :category_id
end
