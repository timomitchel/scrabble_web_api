class Api::V1::Games::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    if OxfordService.new(params[:word]).check_response == false
      render json: {"message": "#{params[:word]} is not a valid word."}
    else
      game = Game.find(params["id"])
      user = User.find(params['user_id'])
      user.plays << Play.create(word: params[:word], game_id: game.id)
      render json: game, :status => 201
    end
  end
end