class PlayersController < ApplicationController
  def index
    @players = Player.where(injured: true)
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to "/players/#{@player.id}"
  end

  private

  def player_params
    params.permit(:name, :age, :injured)
  end
end
