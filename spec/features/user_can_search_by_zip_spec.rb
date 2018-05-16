require 'rails_helper'

describe 'User visits root path and fills in search form' do
  describe 'can see list of 10 closest stations within 6 miles' do
    it 'can see some attributes of each station' do
      VCR.use_cassette('user_can_see_station_information') do
        visit root_path
        # When I visit "/"
        # And I fill in the search form with 80203 (Note: Use the existing search form)
        fill_in :q, with: '80203'
        # And I click "Locate"
        click_on 'Locate'
        # Then I should be on page "/search"
        expect(current_path).to eq(search_path)
        # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
        expect(page).to have_css('.station', count: 2)
        # And the stations should be limited to Electric and Propane
        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
        within(first('.station')) do
          expect(page).to have_css('.name')
          expect(page).to have_css('.address')
          expect(page).to have_css('.fuel_types')
          expect(page).to have_css('.distance')
          expect(page).to have_css('.access_times')
        end
      end
    end
  end
end
