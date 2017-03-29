class Employee < ApplicationRecord
  belongs_to :Store
  has_many :Appointments
  has_one :Image
  has_many :Clients , through:Appointments
end
