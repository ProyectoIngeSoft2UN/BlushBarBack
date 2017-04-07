class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :quantity, :available
end
