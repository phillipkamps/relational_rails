class TeamsController < ApplicationController
  def index
    @teams = Team.order_by_most_recent
  end

  def show
    @team = Team.find(params[:id])
  end
end
