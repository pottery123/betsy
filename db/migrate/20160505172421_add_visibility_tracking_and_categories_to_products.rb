class AddVisibilityTrackingAndCategoriesToProducts < ActiveRecord::Migration
  def change
      change_table :products do |t|
      t.boolean :visible
    end
  end
end
