class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :reviews , :through => :product
  has_many :order_items , :through => :order

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
