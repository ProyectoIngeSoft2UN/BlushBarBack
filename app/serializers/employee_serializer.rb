class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :phone, :store_id
end
