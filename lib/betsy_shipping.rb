require 'httparty'

module BetsyShippingWrapper
  API_URL = "http://localhost:3000/"

  def self.get_quotes(zipcode, quantity)
    HTTParty.get(API_URL + "quotes?zipcode=#{zipcode}&quantity=#{quantity}").parsed_response
  end

end
