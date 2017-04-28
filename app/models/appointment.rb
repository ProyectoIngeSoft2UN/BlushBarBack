class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :employee
  belongs_to :store
  belongs_to :service

  validates :client_id, presence: {message: 'IdCliente no debe ser vacio'}, numericality: { only_integer: true}
  validates :employee_id, presence: {message: 'IdEmployee no debe ser vacio'}, numericality: { only_integer: true}
  validates :store_id, :service_id, presence: true, numericality: { only_integer: true}
  validates :dateTime,  presence: true
  validates :is_paid, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :active, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  #validates :dateTime,

  def self.get_appointments(page, per_page)
    select(:client_id,:employee_id,:id_paid,:active)
    .paginate(:page => page,:per_page => per_page)
    #.paginate(:page => params[:page],:per_page => per_page)
  end

  def self.get_appointments_by_paid(paid,col = nil)
    if col.present?
      if  col.size == 2
        where(is_paid: paid).order(col[1]+' DESC')
      else
        where(is_paid: paid).order(col[0])
      end
    else
      where(is_paid: paid)
    end
  end

  def self.get_appointments_by_active(active,col = nil)
    if col.present?
      if  col.size == 2
        where(active: active).order(col[1]+' DESC')
      else
        where(active: active).order(col[0])
      end
    else
      where(active: active)
    end
  end

  def self.get_appointments_by_datetime(datetime,col = nil)
    if col.present?
      if  col.size == 2
        where(dateTime: dateTime).order(col[1]+' DESC')
      else
        where(dateTime: dateTime).order(col[0])
      end
    # else
    #   where(active: active)
    end
  end

  def self.get_appointments_by_employee_id(id,page,per_page)
    includes(:employee).where(employee_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_appointments_by_client_id(id,page,per_page)
    includes(:client).where(client_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_appointments_by_store_id(id,page,per_page)
    includes(:store).where(store_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_appointments_by_service_id(id,page,per_page)
    includes(:service).where(service_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.is_paid(id)
    select(:id_paid).where(id: id)
  end

  def self.is_active(id)
    select(:active).where(id: id)
  end

  def self.get_dateTime(id)
    select(:dateTime).where(id: id)
  end
end
