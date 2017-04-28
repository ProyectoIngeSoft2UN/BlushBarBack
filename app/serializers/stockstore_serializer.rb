class StockstoreSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :store_id, :available, :quantity
  belongs_to :product
  belongs_to :store
end
