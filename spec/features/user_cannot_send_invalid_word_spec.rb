require 'rails_helper'

  describe 'user can fill in word and validate it' do 
    it 'validates a word' do
        
        visit root_path

        fill_in 'q', with: 'foxez'
        click_on "Validate Word"

        expect(current_path).to eq root_path
        expect(page).to have_content "'foxez' is not a valid word." 
    end
  end