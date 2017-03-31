class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|

      t.string :idProduct null:false
      t.integer :cost null:false
      t.string :payment null:false
      t.text :description

      t.timestamps
    end
  end
end
