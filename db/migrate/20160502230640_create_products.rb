class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name, null: false
      t.decimal :price_in_dollars, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
