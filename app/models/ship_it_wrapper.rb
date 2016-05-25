require 'httparty'

module ShipItWrapper

  BASE_URL = "http://localhost:3000"

  # address = { country: "US", state: "WA", city: "Seattle", zip: "98122" }
  # carrier = "usps"


  def self.get_quote(carrier, address)
    HTTParty.get(BASE_URL + "/quotes/#{carrier}", body: { shipping: {
            "carrier" => carrier,
            "address" => address
          }.to_json }).parsed_response
  end


end
