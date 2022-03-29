class TeamsPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @players = @team.players.order(:name)
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:id])
    @player = @team.players.create!(player_params)
    redirect_to "/teams/#{@team.id}/players"
  end

  private

  def player_params
    params.permit(:name, :age, :injured)
  end
end
