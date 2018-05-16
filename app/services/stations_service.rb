class StationsService
  def initialize(zip)
    @zip = zip
  end

  def stations_query
    response = JSON.parse(make_request.body, symbolize_names: true)
    response[:fuel_stations]
  end

  private

  def make_request
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{@zip}&radius=6&fuel_type=ELEC,LPG&limit=10")
    conn.get do |req|
      req.headers['X-Api-Key'] = ENV['X-API-KEY']
    end
  end
end
