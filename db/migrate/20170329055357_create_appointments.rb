class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      
      t.string :idClient
      t.string :idEmployee
      t.boolean :payment
      t.references :Client, foreign_key: true
      t.references :Employee, foreign_key: true

      t.timestamps
    end
  end
end
