class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
