class TeamsController < ApplicationController
  before_filter :authorize
  before_filter :all_teams, only: [:index, :create]

  def new
    @team = Team.new
  end

  def show
    @team = @current_coach.teams.find(params[:id])
  end

  def create
    @team = @current_coach.teams.create(team_params)
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
