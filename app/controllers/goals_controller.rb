class GoalsController < ApplicationController
  before_action :set_diver, only: :create
  before_action :set_divers, only: :index

  def create
    @diver.goals.create(goal_params)
    flash[:success] = "Goal Added!"
    redirect_to dashboard_path
  end

  def index

  end

  private

  def set_diver
    @diver = current_coach.divers.find(params[:diver_id])
  end

  def set_divers
    @divers = current_coach.divers.active.includes(goals: :dive)
  end

  def goal_params
    params.require(:goal).permit(:dive_id, :note)
  end
end
