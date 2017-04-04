class CreateProductsStores < ActiveRecord::Migration[5.0]
  def change
    create_table :products_stores do |t|
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
