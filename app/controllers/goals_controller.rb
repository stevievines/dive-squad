class GoalsController < ApplicationController
  before_action :set_diver

  def create
    @diver.goals.create(goal_params)
    flash[:success] = "Goal Added!"
    redirect_to dashboard_path
  end

  private

  def set_diver
    @diver = current_coach.divers.find(params[:diver_id])
  end

  def goal_params
    params.require(:goal).permit(:dive_id, :note)
  end
end
