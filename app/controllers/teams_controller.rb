class TeamsController < ApplicationController
  def index
    @teams = Team.order_by_most_recent
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    Team.create!(team_params)
    redirect_to "/teams"
  end

  private

  def team_params
    params.permit(:name, :rank, :won_championship)
  end
end
