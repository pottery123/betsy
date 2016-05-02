class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :user_name,  null: false
      t.text :email,  null: false
      t.text :password,  null: false
      t.text :password_confirmation, null: false

      t.timestamps null: false
    end
  end
end
