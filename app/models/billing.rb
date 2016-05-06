class Billing < ActiveRecord::Base
  belongs_to :order 
  validates :email, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :address, presence: true, uniqueness: true, length: { in: 1..50 }
  validates :name_on_cc, presence: true, length: { in: 1..50 }
  validates :security_on_cc, presence: true, numericality: { only_integer: true }, length: { in: 3 }
  validates :expiration_on_cc, presence: true # As how to validate expiration
  validates :zip, presence: true,  { only_integer: true }, length: { in: 5..9 }
end
