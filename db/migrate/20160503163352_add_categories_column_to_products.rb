class AddCategoriesColumnToProducts < ActiveRecord::Migration
  def change
      change_table :products do |t|
      t.text :categories
    end
  end
end
