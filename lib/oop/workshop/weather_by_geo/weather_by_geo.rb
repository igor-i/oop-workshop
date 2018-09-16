class WeatherByGeo
  attr_reader :geo, :weather

  def initialize(geo, weather)
    @geo = geo
    @weather = weather
  end

  def call(params)
    coordinates = geo.call(params)
    weather.call(coordinates) if coordinates
  end
end
