class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|

      t.string :address null:false
      t.string :city  null:false
      t.string :phone null:false
      t.string :email null:false

      t.timestamps
    end
  end
end
