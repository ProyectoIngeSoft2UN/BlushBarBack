class Change < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :brand, :string, after: :cost
    remove_reference :products, :category
    add_reference :products, :subcategory, index: true, after: :brand
  end
end
