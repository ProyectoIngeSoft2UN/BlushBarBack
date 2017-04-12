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

  def self.get_appointments(page = 1, per_page = 10)
    select(:client_id,:employee_id,:payment,:active)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_appointments_by_employee_id(id)
    includes(:employee).where(employee_id: id)
  end

  def self.get_appointments_by_client_id(id)
    includes(:client).where(client_id: id)
  end

  def self.is_payment(id)
    select(:payment).where(id: id)
  end

  def self.is_active(id)
    select(:active).where(id: id)
  end
end
