class ChangeExpirationToString < ActiveRecord::Migration
  def change
    change_column :orders, :expiration_on_cc, :string
  end
end
