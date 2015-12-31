class DiversController < ApplicationController
  before_action :authorize

  def new
    @diver = Diver.new
    @teams = @current_coach.teams
  end

  def create
    if @diver = Diver.create(diver_params)
      redirect_to diver_path(@diver)
    else
      redirect_to new_diver_path
    end
  end

  def show
    @diver = Diver.find(params[:id])
  end

  private

  def diver_params
    params.require(:diver).permit(:name, :birthday, :email, :phone, :team_id)
  end
end
