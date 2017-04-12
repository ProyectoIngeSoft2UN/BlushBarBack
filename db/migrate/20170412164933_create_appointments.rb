class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :client, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :store, foreign_key: true
      t.references :service, foreign_key: true
      t.boolean :is_paid
      t.boolean :active
      t.datetime :dateTime

      t.timestamps
    end
  end
end
