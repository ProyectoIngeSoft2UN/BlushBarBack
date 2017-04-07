class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :cost, null: false
      t.references :client, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.string :payment, null: false
      t.text :description

      t.timestamps
    end
  end
end
