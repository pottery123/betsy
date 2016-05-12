class Order < ActiveRecord::Base
    has_many :order_items
    validates_length_of :number, is: 10,  message: "Number must be 16 digits long"
    validates_length_of :zip, is: 5
    validates_length_of :credit_card_number, is: 16
    validates_length_of :rsecurity_on_cc, is: 3, message: "The three digit security number is located on the back of the card"
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
