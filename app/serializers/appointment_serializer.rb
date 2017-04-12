class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :idClient, :idEmployee, :payment, :active, :appointmentDate, :appointmentTime
end
