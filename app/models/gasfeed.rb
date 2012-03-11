
require 'rest-client'
require 'crack'

class Gasfeed
  def self.test_gas_prices_for_cambridge
    location = Geokit::Geocoders::GoogleGeocoder.geocode("Boston, MA")
  
    # Development AIP for initial testing and playing with AIP
    gas_feed_url = "http://devapi.mygasfeed.com/"
    gas_feed_api_key = "rfej9napna" #development public key

    gas_feed_url += "stations/radius/"
    gas_feed_url += "#{location.lat}" + "/"
    gas_feed_url += "#{location.lng}" + "/"
    gas_feed_url += "#{100}" + "/"
    gas_feed_url += "reg/"
    gas_feed_url += "price/"
    gas_feed_url += gas_feed_api_key + ".json"

    puts gas_feed_url

    response = RestClient.get(gas_feed_url)
    response = Crack::JSON.parse(response)
    regular = []
    not_available = []


    response["stations"].each do |station|
      unless station["reg_price"] == "N/A"
        regular << station["reg_price"]
      else
        not_available << station["station"]
      end
    end
    
    puts regular
    puts not_available

    return regular 

  end
end
