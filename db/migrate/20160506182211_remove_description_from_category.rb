class RemoveDescriptionFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :description
  end
end
