class Bill < ApplicationRecord
  belongs_to :client
  belongs_to :store
  has_and_belongs_to_many :products

  validates :cost, numericality: {greater_than_or_equal_to: 0}
  validates :payment_method, presence: true
  validates :description, presence: true

  def self.get_bills(page,per_page)
    select(:cost,:client_id,:store_id,:payment_method,:description)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_client_id(id,page,per_page)
    includes(:client).where(client_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_client_cc(cc,page,per_page)
    includes(:client).where(cc: cc)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_store_id(id,page,per_page)
    includes(:store).where(store_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_payment_method(pm,page,per_page)
    where(payment_method: pm)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_cost(cost,page,per_page)
    where(cost: cost)
    .paginate(:page => page,:per_page => per_page)
  end

end
