# Feature:
# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."

require 'rails_helper'

  describe 'user can fill in word and validate it' do 
    it 'validates a word' do
      VCR.use_cassette("user_validates_word") do
        
        visit root_path

        fill_in 'word', with: 'foxes'
        click_on "Validate Word"

        expect(current_path).to eq root_path
        expect(page).to have_content "'foxes' is a valid word and its root form is 'fox'."
          
      end
    end
  end