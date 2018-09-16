require 'geocoder'

class Geo
  # TODO на проде использовать params
  def call(_params)
    # params.coordinates
    results = Geocoder.search('Paris')
    results.first.coordinates
  end
end
