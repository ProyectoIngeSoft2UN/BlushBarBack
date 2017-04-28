class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost
  has_many :appointments
end
