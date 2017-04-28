class ClientSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :phone, :address, :city
  has_many :bills
  has_many :appointments
end
