class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :cost, :idClient, :idProduct, :payment, :description
end
