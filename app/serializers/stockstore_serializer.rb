class StockstoreSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :store_id, :available, :quantity
end
