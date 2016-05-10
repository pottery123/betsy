class FixTypoInOrders < ActiveRecord::Migration
  def change
  remove_column :orders, :emails, :string
  add_column :orders, :email, :string
  end
end
