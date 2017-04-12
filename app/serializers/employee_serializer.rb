class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email
end
