require 'forecast_io'

class Weather
  def call(params)
    ForecastIO.api_key = '0ebc6d81bcc5518b5ec91cad3683c977'
    latitude, longitude = params
    forecast = ForecastIO.forecast(latitude, longitude)
    temperature = (forecast.currently.temperature - 32) * 5 / 9
    "#{temperature.round}, #{forecast.currently.summary}"
  end
end
