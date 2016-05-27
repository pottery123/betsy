require 'httparty'

module ShipItWrapper

  BASE_URL = "http://localhost:3000"

  def self.get_quotes(address)
    HTTParty.get(BASE_URL + "/quotes", body: { shipping: {
            "address" => address
          }.to_json }).parsed_response
  end

end
