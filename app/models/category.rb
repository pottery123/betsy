class Category < ActiveRecord::Base
  # Leah commented this out
  # belongs_to :user
  has_and_belongs_to_many :products

end
