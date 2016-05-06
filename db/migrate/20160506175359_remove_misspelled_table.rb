class RemoveMisspelledTable < ActiveRecord::Migration
  def change
    drop_table :catagory
  end
end
