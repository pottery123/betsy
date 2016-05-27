class AddShippingSelectionFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_selection, :string
  end
end
