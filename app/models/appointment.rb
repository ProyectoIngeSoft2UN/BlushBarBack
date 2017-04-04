class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :employee

  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :employee, presence: {message: 'IdEmployee no debe ser vacio'}
  validates :payment, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :active, inclusion: { in: [true, false], message: 'Debe ser true o false'}

  def self.get_appointments
    include(:idEmployee,:idClient,:payment)
  end

  def self.get_appointments_store_employee(q)
    include(:idEmployee,:idClient,:payment)
    .where(clients:{
        id: q
      })
  end
end
