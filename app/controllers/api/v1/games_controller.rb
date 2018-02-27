class Api::V1::GamesController < ApplicationController

  def index
  end

  def show
    render json: Game.find(params[:id])
  end
end