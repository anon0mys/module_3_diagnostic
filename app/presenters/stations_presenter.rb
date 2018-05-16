class StationsPresenter
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    @service = StationsService.new(zip)
  end

  def stations
    results = @service.stations_query
    results.map do |station_info|
      Station.new(station_info)
    end
  end
end
