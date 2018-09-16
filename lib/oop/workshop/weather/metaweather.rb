class Oop::Workshop::Weather::Metaweather
  URL = 'https://www.metaweather.com'.freeze

  def weather(city)
    place_id = place city
    weather_in_place place_id
  end

  private

  def place(city)
    uri = URI.join(URL, '/api/location/search')
    uri.query = "query=#{city}"
    resp = uri.open.read
    place_hash = JSON.parse(resp.to_s).first
    place_hash['woeid']
  end

  def weather_in_place(place_id)
    uri = URI.join(URL, '/api/location/', place_id.to_s)
    resp = uri.open.read
    weather_hash = JSON.parse(resp.to_s)
    item_weather_hash = weather_hash['consolidated_weather'].first
    item_weather_hash
      .select { |i| %w[the_temp weather_state_name].include? i }
      .map { |_k, v| v }
      .join(', ')
  end
end
