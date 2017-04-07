class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :employee

  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :employee, presence: {message: 'IdEmployee no debe ser vacio'}
  validates :payment, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :active, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  #validates :dateTime,

  def self.get_appointments
    select(:client_id,:employee_id,:payment,:active)
  end
  #Falla
  def self.get_appointments_by_employee_id(q)
    joins(:employee).select(:id,:client_id,:employee_id,'"employees"."name"','"employees"."lastName"',:payment,:active).where(employees:{id: q})
  end
  #Falla
  def self.get_appointments_by_client_id(q)
    joins(:client).select(:client_id,'"clients"."name"','"clients"."lastName"',:payment,:active).where(clients:{id: q})
  end
end
