class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :cc, null: false
      t.string :name, null: false
      t.string :lastName, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :address, :string
      t.string :city, :string

      t.timestamps
    end
  end
end
