class Oop::Workshop::Weather
  autoload 'Metaweather', 'oop/workshop/weather/metaweather'
  autoload 'Fake', 'oop/workshop/weather/fake'

  def self.init(service_name = 'Metaweather', other_services_map = {})
    new(service_name, other_services_map)
  end

  def initialize(service_name, other_services_map)
    @services_map = map.merge(other_services_map)
    @service = @services_map[service_name]
  end

  def weather(city, service_name = nil)
    service = @services_map[service_name] || @service
    service.weather(city)
  end

  private

  def map
    {
      'Metaweather' => Metaweather.new,
      'Fake' => Fake.new
    }
  end
end
