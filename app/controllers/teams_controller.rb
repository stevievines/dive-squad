class TeamsController < ApplicationController
  before_filter :authorize

  def index
    @teams = @current_coach.teams
  end

  def new
    @team = Team.new
  end

  def show
    @team = @current_coach.teams.find(params[:id])
  end

  def create
    if @team = @current_coach.teams.create(team_params)
      redirect_to team_path(@team)
    else
      redirect_to new_team_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
