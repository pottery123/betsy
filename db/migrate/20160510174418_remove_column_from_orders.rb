class RemoveColumnFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_item_collecton, :string
  end
end
