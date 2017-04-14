class CreateStockstores < ActiveRecord::Migration[5.0]
  def change
    create_table :stockstores do |t|
      t.references :product, foreign_key: true,   null: false
      t.references :store, foreign_key: true,   null: false
      t.boolean :available,   null: false
      t.integer :quantity,   null: false

      t.timestamps
    end
  end
end
