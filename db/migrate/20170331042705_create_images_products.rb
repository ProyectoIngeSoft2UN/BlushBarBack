class CreateImagesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :images_products do |t|
      t.references :Image, foreign_key: true
      t.references :Product, foreign_key: true

      t.timestamps
    end
  end
end
