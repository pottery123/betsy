class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :order_item_collecton
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
