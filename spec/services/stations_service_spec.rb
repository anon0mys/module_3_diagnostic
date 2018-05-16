require 'rails_helper'

describe StationsService do
  it 'can make a request to the API' do
    service = StationsService.new('80203')

    stub_request(:get, 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json')
      .to_return(body: './spec/fixtures/json/stations_query.json')

    stations = service.stations_query

    expect(stations).to be_an Array
    expect(stations.first).to be_a Hash
    expect(stations.first[:station_name]).to eq('UDR')
  end
end
