require 'spec_helper'

describe Station do
  describe 'initialize' do
    it 'should have valid attributes' do
      attributes = {
            access_days_time: "24 hours daily",
            station_name: "UDR",
            street_address: "800 Acoma St",
            city: "Denver",
            state: "CO",
            zip: "80204",
            fuel_type_code: "ELEC",
            distance: 0.31422
        }

      address = "#{attributes[:street_address]} #{attributes[:city]}, #{attributes[:state]} #{attributes[:zip]}"
      fuel_types = 'Electric'
      station = Station.new(attributes)

      expect(station.name).to eq(attributes[:station_name])
      expect(station.address).to eq(address)
      expect(station.fuel_types).to eq(fuel_types)
      expect(station.distance).to eq(attributes[:distance])
      expect(station.access_times).to eq(attributes[:access_days_time])
    end
  end
end
