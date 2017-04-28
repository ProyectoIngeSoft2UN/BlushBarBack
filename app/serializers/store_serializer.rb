class StoreSerializer < ActiveModel::Serializer
  attributes :id, :address, :city, :phone, :admin_id, :email
  belongs_to :admin
  has_many :bills
  has_many :stockstores
  has_many :employees
  has_many :appointments
  has_many :products, through: :stockstores

end
