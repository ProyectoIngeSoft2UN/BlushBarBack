class CreateImagesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :images_products do |t|
      t.references :product, foreign_key: true, null: false
      t.references :image, foreign_key: true, null: false

      t.timestamps
    end
  end
end
