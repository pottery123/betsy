class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :reviews
  has_and_belongs_to_many :categories


  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1
  validates_numericality_of :price_in_dollars, :greater_than_or_equal_to => 1

end
