class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :reviews , :through => :product
  has_many :order_items , :through => :order
end
