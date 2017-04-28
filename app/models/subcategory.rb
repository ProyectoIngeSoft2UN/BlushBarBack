class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  validates :name, presence: {message: 'Nombre no debe ser vacio'}
  validates :description, presence: {message: 'Descripcion no debe ser vacia'}
  validates :category_id , numericality: { only_integer: true}, presence: true

  def self.get_subcategories(page, per_page)
    select(:name,:description)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_subcategories_by_name(name,col = nil)
    if col.present?
      if  col.size == 2
        where('name ILIKE ?',"%#{name}%").order(col[1]+' DESC')
      else
        where('name ILIKE ?',"%#{name}%").order(col[0])
      end
    else
      where('name ILIKE ?',"%#{name}%")
    end
  end

  def self.get_category_by_id(id)
    includes(:category).where(category_id: id)
  end

  def self.get_category_by_name(id)
    includes(:category).where(category_id: id)
  end

  def self.get_description_by_id(id)
    select(:name,:description).where(id: id)
  end

  def self.get_description_by_name(name)
    select(:name, :description).where(name: name)
  end

  def self.get_products_by_id(id)
    includes(:products).where(id: id)
    end

  def self.get_products_by_name(name)
    includes(:products).where(name: name)
    end
end
