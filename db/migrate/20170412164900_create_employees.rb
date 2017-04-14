class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :cc, null: false
      t.string :name, null: false
      t.string :lastName, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
