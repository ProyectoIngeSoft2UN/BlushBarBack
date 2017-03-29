class CreateProductsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :products_categories do |t|
      t.references :Category, foreign_key: true
      t.references :Product, foreign_key: true

      t.timestamps
    end
  end
end
