class StationsService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
  end

  def stations_query
    params = {location: @zip, radius: 6, fuel_type: 'ELEC,LPG', limit: 10}
    response = JSON.parse(make_request(params).body, symbolize_names: true)
    response[:fuel_stations]
  end

  private

  def make_request(params)
    @conn.get do |req|
      req.headers['X-Api-Key'] = ENV['X-API-KEY']
      req.params = params
    end
  end
end
