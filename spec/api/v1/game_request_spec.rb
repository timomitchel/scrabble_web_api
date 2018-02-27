require 'rails_helper'

describe 'valid game response with game id and user scores'do 
    let!(:game) {create(:game)}
    let!(:user) {create(:user)}
    let!(:user_2) {create(:user)}
    let!(:play) {create(:play, game_id: game.id, user_id: user.id)}
    let!(:play_2) {create(:play, game_id: game.id, user_id: user_2.id)}
    it 'gets a specific json response when it runs a get' do
    
      get "/api/v1/games/#{game.id}"

      game_response = JSON.parse(response.body)
      expect(response).to be_successful
      expect(game_response['game_id']).to eq game.id
      expect(game_response['scores'].class).to eq Array
  end

  it 'posts a play to the game' do
    post "/api/v1/games/#{game.id}/plays?user_id=#{user.id}&word=at"

    game_response = JSON.parse(response.body)
    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(game_response['game_id']).to eq game.id
    expect(game_response['scores'].class).to eq Array
  end
end