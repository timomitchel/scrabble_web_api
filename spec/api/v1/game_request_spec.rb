require 'rails_helper'

describe 'calid game response with game id and user scores'do 
    let(:game) {create(game)}
    let(:user) {create(:user)}
    let(:user_2) {create(:user)}
    let(:play) {create(:play, game_id: game.id, user_id: user.id)}
    let(:play_2) {create(:play, game_id: game.id, user_id: user_2.id)}
    it 'gets a specific json response when it runs a get' do
    
      get '/api/v1/games'

      game_response = JSON.parse(response.body)
      expect(response).to be_successful
  end
end