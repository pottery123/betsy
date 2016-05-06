class AddDescriptionToProducts < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.text :description, null: false
    end
  end
end
