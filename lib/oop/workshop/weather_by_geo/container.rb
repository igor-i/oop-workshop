autoload 'WeatherByGeo', 'oop/workshop/weather_by_geo/weather_by_geo'
autoload 'Geo', 'oop/workshop/weather_by_geo/geo'
autoload 'Weather', 'oop/workshop/weather_by_geo/weather'
autoload 'Ip', 'oop/workshop/weather_by_geo/ip'

class Container
  extend Dry::Container::Mixin
end

Container.register 'ip' do
  Ip.new
end

Container.register 'geo' do
  Geo.new
end

Container.register 'weather' do
  Weather.new
end

Container.register 'weather_by_geo' do
  WeatherByGeo.new(
    Container['geo'],
    Container['weather'],
  )
end
