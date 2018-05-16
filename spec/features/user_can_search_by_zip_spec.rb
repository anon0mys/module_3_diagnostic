require 'rails_helper'

feature 'User can enter zip into search bar' do
  context 'and see search information for that zip' do
    it 'should return the 10 closest stations' do
      visit root_path

      fill_in 'q', with: 80203
      click_on 'Locate'

      expect(current_path).to eq(search_path)

      expect(page).to have_css('.station-info', count: 10)

      station_info = JSON.parse(File.read('./spec/fixtures/json/single_station.json'), symbolize_names: true)

      station = Station.new(station_info)

      within first('.station-info') do
        expect(page).to have_content(station.name)
        expect(page).to have_content(station.full_address)
        expect(page).to have_content(station.fuel_types)
        expect(page).to have_content(station.distance)
        expect(page).to have_content(station.access_times)
      end
    end

    it 'should return a different 10 using a different zip' do
    end
  end
end
