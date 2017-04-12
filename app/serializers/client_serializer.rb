class ClientSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :password
end
