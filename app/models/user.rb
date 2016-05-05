class User < ActiveRecord::Base

  # attr_accessor :user_name, :password, :password_confirmation
  has_many :products
  has_many :orders
  has_many :reviews , :through => :product
  has_many :order_items , :through => :order

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  # def self.log_in(email, password)
  #   somebody = find_by(email: email)
  #   somebody && somebody.authenticate(password)
  # end
end
