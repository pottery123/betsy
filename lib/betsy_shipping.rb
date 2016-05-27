require 'httparty'

module BetsyShippingWrapper
  API_URL = "http://localhost:3000/"

  def self.get_quotes(zipcode, quantity, order_id)
    response = HTTParty.get(API_URL + "quotes?zipcode=#{zipcode}&quantity=#{quantity}&order_id=#{order_id}")
    return response
  end
end
