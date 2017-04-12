class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :cost
      t.references :client, foreign_key: true
      t.references :store, foreign_key: true
      t.string :payment_method
      t.text :description

      t.timestamps
    end
  end
end
