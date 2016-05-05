class AddColumnForPictureUrlToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.text :image_url
    end
  end
end
