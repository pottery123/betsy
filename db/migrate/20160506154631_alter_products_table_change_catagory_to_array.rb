class AlterProductsTableChangeCatagoryToArray < ActiveRecord::Migration
  def change
      # change_column :products, :categories, :text, array: true, default: []
      change_column :products, :categories, :text, array: true, default: [], using: "(string_to_array(categories, ' '))"
  end
end
