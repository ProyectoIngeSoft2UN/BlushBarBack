class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :store_id
end
