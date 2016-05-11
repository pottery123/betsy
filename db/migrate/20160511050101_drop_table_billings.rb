class DropTableBillings < ActiveRecord::Migration
  def change
    drop_table :billings
  end
end
