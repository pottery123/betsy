class AddBillingtoOrders < ActiveRecord::Migration
  def change
    add_column :orders, :emails, :string
    add_column :orders, :address, :string
    add_column :orders, :name_on_cc, :string
    add_column :orders, :security_on_cc, :integer
    add_column :orders, :expiration_on_cc, :datetime
    add_column :orders, :zip, :integer
  end
end