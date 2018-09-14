require 'uri'
require 'open-uri'
require 'json'

require 'oop/workshop/version'
require 'oop/workshop/location_data'

module Oop
  # curl http://ip-api.com/json/134.234.3.2
  module Workshop
    URL = 'http://ip-api.com'.freeze

    def self.search_location_by_ip(ip)
      uri = URI.join(URL, '/json/', ip)
      resp = uri.open.read
      location_hash = JSON.parse(resp.to_s)
      LocationData.new location_hash
    end
  end
end
