class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :id
      t.string :idProduct
      t.integer :cost
      t.string :payment
      t.text :description

      t.timestamps
    end
  end
end
