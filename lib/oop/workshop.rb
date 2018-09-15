require 'uri'
require 'open-uri'
require 'json'
require 'oop/workshop/version'

module Oop
  # curl http://ip-api.com/json/134.234.3.2
  module Workshop
    autoload 'LocationData', 'oop/workshop/location_data'
    autoload 'StringHelper', 'oop/workshop/string_helper'
    autoload 'ArrayHelper', 'oop/workshop/array_helper'

    URL = 'http://ip-api.com'.freeze

    def self.uri(ip)
      URI.join(URL, '/json/', ip)
    end

    def self.search_location_by_ip(ip)
      resp = uri(ip).open.read
      location_hash = JSON.parse(resp.to_s)
      LocationData.new location_hash
    end

    def self.chain
      files = Dir.glob('*')
      processed_files = files.reject { |i| i.start_with? '.' }.sort
      middle_file = ArrayHelper.middle(processed_files)
      StringHelper.plural(middle_file).upcase
    end

    def self.weather(city)
    end
  end
end
