require 'thor'

require 'oop/workshop'

module Oop
  module Workshop
    class CLI < Thor
      desc "weather ITEM", "Determines what weather is in the city"
      def weather(city)
        puts Oop::Workshop.weather(name)
      end
    end
  end
end
