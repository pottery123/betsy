class OrdersColoumnsNullFalse < ActiveRecord::Migration
  def change
    change_column :orders, :address, :string, null: false
    change_column :orders, :name_on_cc, :string, null: false
    change_column :orders, :security_on_cc, :string, null: false
    change_column :orders, :expiration_on_cc, :datetime, null: false
    change_column :orders, :zip, :integer, null: false
    change_column :orders, :email, :string, null: false
    change_column :orders, :status, :string, null: false
    change_column :orders, :credit_card_number, :string, null: false
  end
end
