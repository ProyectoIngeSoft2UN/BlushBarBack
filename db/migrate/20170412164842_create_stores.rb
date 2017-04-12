class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :address
      t.string :city
      t.string :phone
      t.references :admin, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
