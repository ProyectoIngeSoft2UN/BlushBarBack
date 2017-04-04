class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :client, foreign_key: true
      t.references :employee, foreign_key: true
      t.boolean :payment
      t.boolean :active

      t.timestamps
    end
  end
end
