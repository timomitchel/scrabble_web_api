class Api::V1::GamesController < ApplicationController

  def index
  end

  def show
    render json: Game.find(params[:id]).as_json({only: :id, include: {:player_1 => {:only => [:id, :score]}, :player_2 => {:only =>[:id, :score]}}})
  end
end