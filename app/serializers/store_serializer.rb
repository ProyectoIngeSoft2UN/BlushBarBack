class StoreSerializer < ActiveModel::Serializer
  attributes :id, :address, :city, :phone, :admin_id, :email
end
