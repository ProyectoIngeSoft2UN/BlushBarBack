class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,   null: false
      t.text :description,  null: false
      t.references :category, foreign_key: true,   null: false
      t.integer :cost,   null: false

      t.timestamps
    end
  end
end
