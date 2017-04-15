class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :cost, null: false
      t.references :client, foreign_key: true, null: false
      t.references :store, foreign_key: true, null: false
      t.string :payment_method, null: false
      t.text :description,  null: false

      t.timestamps
    end
  end
end
