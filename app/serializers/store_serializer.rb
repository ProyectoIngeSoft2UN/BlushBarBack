class StoreSerializer < ActiveModel::Serializer
  attributes :id, :address, :city, :phone, :idAdmin, :email
end
