class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :category_id, :subcategory_id
  end
end
