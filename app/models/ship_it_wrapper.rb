require 'httparty'

module ShipItWrapper

  BASE_URL = "http://ship-it-api.herokuapp.com"

  def self.get_quotes(address)
    HTTParty.get(BASE_URL + "/quotes", body: { shipping: {
            "address" => address
          }.to_json })
  end

end
