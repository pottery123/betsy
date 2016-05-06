class RemoveCatagoriesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :categories
  end
end
