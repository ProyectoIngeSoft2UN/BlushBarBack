class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :path,   null: false
      t.text :description,   null: false

      t.timestamps
    end
  end
end
