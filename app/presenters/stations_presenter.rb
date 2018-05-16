class StationsPresenter
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    @service = StationsService.new(zip)
  end
end
