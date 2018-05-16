require 'rails_helper'

feature 'User can enter zip into search bar' do
  context 'and see search information for that zip' do
    it 'should return the 10 closest stations' do
      visit root_path

      fill_in 'q', with: 80203
      click_on 'Locate'

      expect(current_path).to eq(search_path)

      expect(page).to have_css('.station-info', count: 10)
    end

    it 'should return a different 10 using a different zip' do
    end
  end
end
