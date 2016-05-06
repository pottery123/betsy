class Billing < ActiveRecord::Base
  belongs_to :order 
  validates :email, presence: true, format: {with: /@/}
  validates :address, presence: true, uniqueness: true, length: { in: 1..50 }
  validates :name_on_cc, presence: true, length: { in: 1..50 }
  validates :number_on_cc, presence: true, numericality: { only_integer: true }, length: { is: 16 }
  validates :security_on_cc, presence: true, numericality: { only_integer: true }, length: { is: 3 }
  validates :expiration_on_cc, presence: true # how to validate expiration not in the past?
  validates :zip, presence: true, numericality: { only_integer: true }, length: { in: 5..9 }
  
  def expiration_date_cannot_be_in_the_past
    if !expiration_date.blank? and expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
