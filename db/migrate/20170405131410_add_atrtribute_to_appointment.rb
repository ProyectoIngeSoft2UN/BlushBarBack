class AddAtrtributeToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :appointmentDate, :date
    add_column :appointments, :appointmentTime, :time
  end
end
