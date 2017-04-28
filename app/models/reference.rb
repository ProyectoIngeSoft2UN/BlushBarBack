class Reference < ApplicationRecord
  belongs_to :product

  validates :name ,presence: true
  validates :product_id, presence: true
  validates :description, presence: true

  def self.get_references(page,per_page)
    paginate(:page => page,:per_page => per_page)
  end

  def self.get_references_by_name(name,col = nil)
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

  def self.get_product_of(name)
    includes(:product).where(name: name)
  end
end
