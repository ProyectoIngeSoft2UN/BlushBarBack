class Store < ApplicationRecord
  belongs_to :admin
  has_many :employees
  has_and_belongs_to_many :products
end
