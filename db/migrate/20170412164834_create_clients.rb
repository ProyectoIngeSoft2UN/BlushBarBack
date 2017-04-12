class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :cc
      t.string :name
      t.string :lastName
      t.string :email
      t.string :phone
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
