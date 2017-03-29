class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :id
      t.string :name
      t.string :lastName
      t.string :email
      t.string :phone
      t.image :photo
      t.references :Store, foreign_key: true

      t.timestamps
    end
  end
end
