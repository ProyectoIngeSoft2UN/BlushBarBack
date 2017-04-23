class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
