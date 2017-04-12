class CreateBillProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_products do |t|
      t.references :bill, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
