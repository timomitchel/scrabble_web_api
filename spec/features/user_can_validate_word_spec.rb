# Feature:
# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."

require 'rails_helper'

  describe 'user can fill in word and validate it' do 
    it 'validates a word' do
        stub_request(:get, "https://od-api.oxforddictionaries.com/api/v1/inflections/en/foxez").
        with(  headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'App-Id'=>'b3eaa14e',
        'App-Key'=>'145d2c80ef1ee1180e86283560fa4e03',
        'User-Agent'=>'Faraday v0.14.0'
          }).
        to_return(status: 200, body: "", headers: {})

        visit root_path

        fill_in 'q', with: 'foxes'
        click_on "Validate Word"

        expect(current_path).to eq root_path
        expect(page).to have_content "'foxes' is a valid word and its root form is 'fox'." 
    end
  end