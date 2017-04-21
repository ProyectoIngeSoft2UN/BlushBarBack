class Change < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :category
    add_reference :products, :subcategory, index: true
  end
end
