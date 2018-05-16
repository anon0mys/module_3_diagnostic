require 'rails_helper'

describe StationsService do
  it 'can make a request to the API' do
    service = StationsService.new('80203')

    stub_request(:get, 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json')
      .to_return(body: './spec/fixtures/json/stations_query.json')

    expect(service.stations_query).to be_an Array
    expect(service.stations_query.first).to be_a Hash
    expect(service.stations_query.first[:name]).to eq('UDR')
  end
end
