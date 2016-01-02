class DiversController < ApplicationController
  before_action :authorize
  before_action :all_teams, :all_divers, only: [:create]

  def new
    @diver = Diver.new
    @teams = @current_coach.teams
  end

  def create
    @diver = Diver.create(diver_params)
  end

  def show
    @diver = Diver.find(params[:id])
  end

  private

  def diver_params
    params.require(:diver).permit(:name, :birthday, :email, :phone, :team_id)
  end
end
