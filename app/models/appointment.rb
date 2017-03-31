class Appointment < ApplicationRecord
  belongs_to :Client
  belongs_to :Employee

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
