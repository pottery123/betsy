class AddCreditCardNumberToOrders < ActiveRecord::Migration
  def change

    add_column :orders, :credit_card_number, :integer
  end
end
