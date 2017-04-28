class BillSerializer < ActiveModel::Serializer
  attributes :id, :cost, :client_id, :store_id, :payment_method, :description
  belongs_to :bill
  belongs_to :product
end
