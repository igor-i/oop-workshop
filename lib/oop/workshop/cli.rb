require 'thor'

require 'oop/workshop'

module Oop
  module Workshop
    # https://www.metaweather.com/api/location/44418/
    class CLI < Thor
      desc 'weather ITEM', 'Determines what weather is in the city'
      method_option :service, :aliases => '-s', :default => 'metaweather.com', :enum => %w['metaweather.com' 'other.service'].freeze
      def weather(city)
        puts Oop::Workshop.weather(city, options[:service])
      end

      desc 'test', 'Simple test'
      def test
        puts "It's working!"
      end
    end
  end
end
