class Api::V1::Games::PlaysController < ApplicationController

  def create
    user = User.find(params['user_id'])
    user.plays << Play.create(word: params[:word], game_id: params[:id])
  end
end