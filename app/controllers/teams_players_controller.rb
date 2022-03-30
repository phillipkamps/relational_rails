class TeamsPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @players = if params[:alpha] == "yes"
      @team.players.order(:name)
    elsif !params[:older_than].nil?
      @team.players.older_than(params[:older_than])
    else
      @team.players
    end
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
