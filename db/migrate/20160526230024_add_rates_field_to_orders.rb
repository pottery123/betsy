class AddRatesFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :rates, :string
  end
end
