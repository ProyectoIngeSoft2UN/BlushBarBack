class ClientSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :phone, :address, :city
end
