class TeamsController < ApplicationController
  before_filter :authorize
  before_filter :all_teams, only: [:index, :create, :update, :destroy]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_divers, only: [:show]

  def new
    @team = Team.new
  end

  def show
    @team = @current_coach.teams.find(params[:id])
  end

  def create
    @team = @current_coach.teams.create(team_params)
  end

  def update
    @team.update_attributes(team_params)
  end

  def destroy
    @team.destroy
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:id])
  end

  def set_divers
    @divers = @team.divers
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
