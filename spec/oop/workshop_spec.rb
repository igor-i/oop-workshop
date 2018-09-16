require 'oop/workshop'

RSpec.describe Oop::Workshop do
  before do
    @geo_ip = '134.234.3.2'
    stub_request(:get, Oop::Workshop.uri(@geo_ip).to_s)
      .to_return(body: load_fixture('ip-api.json'))

    @weather_service1 = 'Metaweather'
    @weather_service2 = 'Fake'
    @city = 'london'
    @place_id = 44418
    stub_request(:get, "https://www.metaweather.com/api/location/search?query=#{@city}")
      .to_return(body: load_fixture('metaweather_place.json'))
    stub_request(:get, "https://www.metaweather.com/api/location/#{@place_id}")
      .to_return(body: load_fixture('metaweather.json'))
  end

  it 'has a version number' do
    expect(Oop::Workshop::VERSION).not_to be nil
  end

  it 'IP is in United States' do
    # WebMock.allow_net_connect!
    location = Oop::Workshop.search_location_by_ip @geo_ip
    expect(location.query).to eql '134.234.3.2'
    expect(location.status).to eql 'success'
    expect(location.country).to eql 'United States'
    expect(location.city).to eql 'Sierra Vista (Fort Huachuca)'
    expect(location.country_code).to eql 'US'
    expect(location.lat.to_s).to eql '31.5552'
    expect(location.lon.to_s).to eql '-110.35'
    expect(location.region_name).to eql 'Arizona'
    expect(location.timezone).to eql 'America/Phoenix'
    expect(location.zip).to eql '85613'
  end

  it 'has a files in current directory' do
    expect(Oop::Workshop.chain).not_to be nil
  end

  it 'weather with the first service' do
    # WebMock.allow_net_connect!
    weather = Oop::Workshop.weather @city, @weather_service1
    expect(weather).to eql 'Heavy Cloud, 19.85'
  end

  it 'weather with the second service' do
    weather = Oop::Workshop.weather @city, @weather_service2
    expect(weather).to eql 'Beautiful weather'
  end

  it 'change weather services' do
    # WebMock.allow_net_connect!
    w = Oop::Workshop::Weather.init @weather_service1
    expect(w.weather @city).to eql 'Heavy Cloud, 19.85'
    expect(w.weather @city, @weather_service2).to eql 'Beautiful weather'
  end

  it 'add another weather service' do
    class AnotherWeatherService
      def weather(_city)
        'Cloud, 19'
      end
    end
    w = Oop::Workshop::Weather.init @weather_service1, { 'Another' => AnotherWeatherService.new }
    expect(w.weather @city).to eql 'Heavy Cloud, 19.85'
    expect(w.weather @city, 'Another').to eql 'Cloud, 19'
  end
end
