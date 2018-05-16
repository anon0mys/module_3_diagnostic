class SearchController < ApplicationController
  def index
    @presenter = StationsPresenter.new(params[:q])
    # conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG&limit=10')
    # response = conn.get do |req|
    #   req.headers['X-Api-Key'] = ENV['X-API-KEY']
    # end
    # query_results = JSON.parse(response.body, symbolize_names: true)
  end
end
