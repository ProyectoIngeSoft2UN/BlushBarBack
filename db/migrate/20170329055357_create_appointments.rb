class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|

      t.string :idClient  null:false
      t.string :idEmployee  null:false
      t.boolean :payment  null:false
      t.references :Client, foreign_key: true
      t.references :Employee, foreign_key: true

      t.timestamps
    end
  end
end
