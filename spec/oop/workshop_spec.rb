require 'oop/workshop'

RSpec.describe Oop::Workshop do
  before do
    @ip = '134.234.3.2'
    stub_request(:get, Oop::Workshop.uri(@ip).to_s)
      .to_return(body: load_fixture('ip-api.json'))
  end

  it 'has a version number' do
    expect(Oop::Workshop::VERSION).not_to be nil
  end

  it 'IP is in United States' do
    location = Oop::Workshop.search_location_by_ip @ip
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

  it 'middle file with chain must be a "BINS"' do
    expect(Oop::Workshop.chain).to eql 'BINS'
  end
end
