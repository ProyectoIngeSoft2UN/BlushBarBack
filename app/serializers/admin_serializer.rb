class AdminSerializer < ActiveModel::Serializer
   #Attributes we want to see in our JSON
  attributes :id, :cc, :name, :lastName, :email, :phone
  has_one :store
end
