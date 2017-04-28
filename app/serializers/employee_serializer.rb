class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :cc, :name, :lastName, :email, :phone, :store_id
  belongs_to :store
  has_many :appointments
end
