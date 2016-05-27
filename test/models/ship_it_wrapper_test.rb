require 'test_helper'

class ShipItWrapperTest < ActiveSupport::TestCase

  describe ShipItWrapper do
    before do
      @order = Order.new(id: 7, user_id: nil, address: "", name_on_cc: "", security_on_cc: nil, expiration_on_cc: "1-2016", zip: 98122, email: "", total: nil, status: "pending", credit_card_number: nil, city: "Seattle", state: "WA", country: "US")
      @address = { country: @order.country, state: @order.state, city: @order.city, zip: @order.zip }
    end

    it "should return a hash when given good data" do
      @quotes = ShipItWrapper.get_quotes(@address)
      assert_instance_of Hash, @quotes, "Not a hash"
    end

  end
end
