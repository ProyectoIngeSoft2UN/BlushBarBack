class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :cost
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.string :payment
      t.text :description

      t.timestamps
    end
  end
end
