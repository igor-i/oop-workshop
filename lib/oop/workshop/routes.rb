require 'bundler/setup'
require 'sinatra'
require 'dry-container'
require 'geocoder'

autoload 'Container', 'oop/workshop/weather_by_geo/container'

get '/' do
  'Hello world!'
end

get '/ip' do
  Container['ip'].(request.location)
end

get '/weather' do
  Container['weather_by_geo'].(request.location)
end
