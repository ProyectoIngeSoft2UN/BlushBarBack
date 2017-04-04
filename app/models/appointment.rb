class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :employee

  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :employee, presence: {message: 'IdEmployee no debe ser vacio'}
  validates :payment, presence: {message: 'Payment no debe ser vacio'}
  validates :active, presence: {message: 'Active no debe ser vacio'}

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
