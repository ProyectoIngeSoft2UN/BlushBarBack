class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :subcategory_id, :cost
end
