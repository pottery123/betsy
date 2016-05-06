class AddDescToProducts < ActiveRecord::Migration
  def change
      change_table :products do |t|
      t.text :description
    end
  end
end
