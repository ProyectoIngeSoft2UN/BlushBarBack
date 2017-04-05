class CreateCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_products do |t|
      t.references :product, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
