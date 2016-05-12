class ChangeBackToFalseTrue < ActiveRecord::Migration
  def change
    change_column :orders, :address, :string, null: true
    change_column :orders, :name_on_cc, :string, null: true
    change_column :orders, :security_on_cc, :string, null: true
    change_column :orders, :expiration_on_cc, :string, null: true
    change_column :orders, :zip, :integer, null: true
    change_column :orders, :email, :string, null: true
    change_column :orders, :status, :string, null: true
    change_column :orders, :credit_card_number, :string, null: true
  end
end
