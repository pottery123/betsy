require 'httparty'

module BetsyShippingWrapper
  API_URL = "http://localhost:3000/"

  def self.get_quotes(zipcode, quantity, order_id)
    HTTParty.get(API_URL + "quotes?zipcode=#{zipcode}&quantity=#{quantity}&order_id=#{order_id}").parsed_response
  end

end
