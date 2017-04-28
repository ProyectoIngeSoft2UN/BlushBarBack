class Bill < ApplicationRecord
  belongs_to :client
  belongs_to :store
  has_and_belongs_to_many :products

  validates :payment_method, presence: {message: 'Debe especificar el método de pago'}
  validates :description, presence: {message: 'Debe especificar una descripcion'}
  validates :cost, :client_id, :store_id , presence: true,numericality: { only_integer: true}

  def self.get_bills(page,per_page)
    select(:cost,:client_id,:store_id,:payment_method,:description)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_bills_by_payment(payment,col = nil)
    if col.present?
      if  col.size == 2
        where(payment_method: payment).order(col[1]+' DESC')
      else
        where(payment_method: payment).order(col[0])
      end
    else
      where(payment_method: payment)
    end
  end

  def self.get_bills_by_cost(cost,col = nil)
    if col.present?
      if  col.size == 2
        #where('CAST(cost AS TEXT) LIKE ?',"%#{cost}%").
        order(col[1]+' DESC')
      else
        #where('CAST(cost AS TEXT) LIKE ?',"%#{cost}%").
        order(col[0])
      end
    # else
    #   where('CAST (cost AS TEXT) LIKE ?',"%#{cost}%")
    end
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

  # def self.get_bills_by_payment_method(pm,page,per_page)
  #   where(payment_method: pm)
  #   .paginate(:page => page,:per_page => per_page)
  # end

  # def self.get_bills_by_cost(cost,page,per_page)
  #   where(cost: cost)
  #   .paginate(:page => page,:per_page => per_page)
  # end

end
