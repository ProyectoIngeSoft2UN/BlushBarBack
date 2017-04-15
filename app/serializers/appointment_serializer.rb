class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :employee_id, :store_id, :service_id, :id_paid, :active, :dataTime
end
