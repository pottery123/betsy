require 'date'

class Order < ActiveRecord::Base
    has_many :order_items
    validates :credit_card_number, length: { is: 16 }
    # validates_length_of :zip, is: 5
    # validates_length_of :credit_card_number, is: 16
    # validates_length_of :rsecurity_on_cc, is: 3, message: "The three digit security number is located on the back of the card"
    # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # validates :email, uniqueness: true


    # def card_not_expired
    #
    #   if expiration_on_cc.present? and (expiration_on_cc >= Time.now.year or
    #     (expiration_on_cc == Time.now.year and exp_month >= Time.now.month))
    #     true
    #   end
    #
    #   # Raise error for expired card
    #   errors.add(:exp_month, "can't be in the past")
    #end


end
