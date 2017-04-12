class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :cc
      t.string :name
      t.string :lastName
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
