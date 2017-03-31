class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|

      t.string :name  null:false
      t.string :lastName  null:false
      t.string :email null:false
      t.string :phone
      t.text :photo
      t.references :Store, foreign_key: true

      t.timestamps
    end
  end
end
