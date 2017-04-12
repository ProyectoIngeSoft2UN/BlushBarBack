class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :employee
  belongs_to :store
  belongs_to :service

  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :employee, presence: {message: 'IdEmployee no debe ser vacio'}
  validates :payment, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :active, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  #validates :dateTime,
end
