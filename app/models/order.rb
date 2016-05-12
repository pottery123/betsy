class Order < ActiveRecord::Base
    has_many :order_items

    # validates :credit_card_number, length: { is: 16 }
    # validate :card_not_expired
    

    # def card_not_expired
    #   # month = params[:orders][:expiration_on_cc][0..1]
    #   # year = params[:orders][:expiration_on_cc][-4..-1]
    #   if expiration_on_cc.present? and (Time.parse(year) >= Time.now.year or 
    #     (exp_year == Time.now.year and Time.parse(month) >= Time.now.month))
    #     true
    #   end

    #   # Raise error for expired card
    #   errors.add(:expiration_on_cc, "can't be in the past")
    # end
    # raise
end
