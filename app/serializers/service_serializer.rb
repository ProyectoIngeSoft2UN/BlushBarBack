class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost
end
