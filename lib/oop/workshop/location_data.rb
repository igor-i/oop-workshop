class Oop::Workshop::LocationData
  def initialize(location)
    @location = location
  end

  def country
    @location['country']
  end

  def city
    @location['city']
  end

  def country_code
    @location['countryCode']
  end

  def lat
    @location['lat']
  end

  def lon
    @location['lon']
  end

  def region_name
    @location['regionName']
  end

  def timezone
    @location['timezone']
  end

  def zip
    @location['zip']
  end

  def status
    @location['status']
  end

  def query
    @location['query']
  end
end
