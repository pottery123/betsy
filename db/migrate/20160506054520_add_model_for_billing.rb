class AddModelForBilling < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.text     :email, null: false
      t.text     :address, null: false
      t.text     :name_on_cc, null: false
      t.integer  :number_on_cc, null: false
      t.text     :security_on_cc, null: false
      t.datetime :expiration_on_cc, null: false
      t.integer  :zip, null: false

      t.timestamps null: false
  end
end
