class CreateStockstores < ActiveRecord::Migration[5.0]
  def change
    create_table :stockstores do |t|
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true
      t.boolean :available
      t.integer :quantity

      t.timestamps
    end
  end
end
