class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :client, foreign_key: true, null: false
      t.references :employee, foreign_key: true, null: false
      t.references :store, foreign_key: true,  null: false
      t.references :service, foreign_key: true,  null: false
      t.boolean :is_paid, null: false
      t.boolean :active, null: false
      t.datetime :dateTime, null: false

      t.timestamps
    end
  end
end
