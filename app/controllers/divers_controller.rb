class DiversController < ApplicationController
  before_action :authorize
  before_action :all_teams, only: [:edit, :create, :update, :destroy]
  before_action :all_divers, only: [:index, :create, :update, :destroy]
  before_action :set_diver, only: [:edit, :update, :destroy]

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

  def update
    @diver.update_attributes(diver_params)
  end

  def destroy
    @diver.destroy
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:id])
  end

  def diver_params
    params.require(:diver).permit(:name, :join_date, :birthday, :email, :phone, :team_id)
  end
end
