class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG&limit=10')
    response = conn.get do |req|
      req.headers['X-Api-Key'] = ENV['X-API-KEY']
    end
    query_results = JSON.parse(response.body, symbolize_names: true)
    @stations = query_results[:fuel_stations].map do |station_info|
      Station.new(station_info)
    end
  end
end
