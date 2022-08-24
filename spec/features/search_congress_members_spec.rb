require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe 'happy path', vcr: 'search_senate' do
    # before :each do

    #   json_body = File.read('spec/fixtures/members_of_the_senate.json')

    #   stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
    #      with(
    #        headers: {
    #       'Accept'=>'*/*',
    #       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #       'User-Agent'=>'Faraday v1.8.0',
    #       'X-Api-Key'=> ENV['govt_api_key']
    #        }).
    #      to_return(status: 200, body: json_body, headers: {})
    # end

    it 'allows user to search for govt members' do
      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end

    it 'allows user to search for another govt member' do
      visit root_path

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Cory Booker was found!")
      expect(page).to have_content("SenBooker")
    end
  end
end
