class TeamsPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
  end
end
