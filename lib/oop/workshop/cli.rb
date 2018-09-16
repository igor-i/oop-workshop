require 'thor'
require 'oop/workshop'

class Oop::Workshop::CLI < Thor
  desc 'weather ITEM', 'Determines what weather is in the city'
  method_option :service, :aliases => '-s', :default => 'Metaweather', :enum => %w[Metaweather Fake].freeze
  def weather(city)
    puts Oop::Workshop.weather(city, options[:service])
  end

  desc 'test', 'Simple test'
  def test
    puts "It's working!"
  end
end
