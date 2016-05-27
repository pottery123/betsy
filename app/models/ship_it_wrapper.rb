require 'httparty'

module ShipItWrapper

  BASE_URL = "http://ship-it-api.herokuapp.com"

  def self.get_quotes(address, num_items)
    HTTParty.get(BASE_URL + "/quotes", body: { shipping: {
            "address" => address, "number_of_items" => num_items
          }.to_json })
  end

end
