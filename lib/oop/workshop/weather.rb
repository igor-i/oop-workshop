class Oop::Workshop::Weather
  autoload 'Metaweather', 'oop/workshop/weather/metaweather'
  autoload 'Fake', 'oop/workshop/weather/fake'

  def self.init(service = 'Metaweather')
    new service
  end

  def initialize(service)
    @service_obj = map[service]
  end

  def weather(city, service = nil)
    return @service_obj.weather(city) unless service
    service_obj = map[service]
    service_obj.weather(city)
  end

  private

  def map
    {
      'Metaweather' => Metaweather.new,
      'Fake' => Fake.new
    }
  end
end
