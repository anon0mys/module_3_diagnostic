class StationsService
  def initialize(zip)
    @zip = zip
  end

  def stations_query
    JSON.parse(make_request, symbolize_names: true)
  end

  private

  def make_request
    conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG&limit=10')
    conn.get do |req|
      req.headers['X-Api-Key'] = ENV['X-API-KEY']
    end
  end
end
