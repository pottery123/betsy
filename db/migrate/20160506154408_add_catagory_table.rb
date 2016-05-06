class AddCatagoryTable < ActiveRecord::Migration
   def change
    create_table :catagory do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
