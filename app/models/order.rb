class Order < ActiveRecord::Base
    has_many :order_items

    # validates :credit_card_number, length: { is: 16 }
    validate :card_not_expired
    

    def card_not_expired
      if expiration_on_cc.present? && expiration_on_cc >= Time.now
        true
      end

      # Raise error for expired card
      errors.add(:expiration_on_cc, "can't be in the past")
    end
end
