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

      station = Station.new(attributes)

      expect(station.name).to eq(attributes[:station_name])
      expect(station.street_address).to eq(attributes[:street_address])
      expect(station.city).to eq(attributes[:city])
      expect(station.state).to eq(attributes[:state])
      expect(station.zip).to eq(attributes[:zip])
      expect(station.fuel_types).to eq(attributes[:fuel_type_code])
      expect(station.distance).to eq(attributes[:distance])
      expect(station.access_times).to eq(attributes[:access_days_time])
    end
  end

  describe 'instance methods' do
    it 'should concatenate a #full_address' do
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

      station = Station.new(attributes)
      address = "#{attributes[:street_address]} #{attributes[:city]} #{attributes[:state]}, #{attributes[:zip]}"

      expect(station.full_address).to eq(address)
    end
  end
end
