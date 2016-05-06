class AddNameColumnToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.text :name
    end

  end
end
