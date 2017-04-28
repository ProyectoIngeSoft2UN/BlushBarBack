class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :employee_id, :store_id, :service_id, :is_paid, :active, :dateTime
  belongs_to :client
  belongs_to :employee
  belongs_to :store
  belongs_to :service
end
