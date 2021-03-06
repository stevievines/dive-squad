class GoalsController < ApplicationController
  before_action :set_diver, only: :create
  before_action :set_divers, only: :index
  # This is needed to re-seed the add goal form
  before_action :all_dives

  def create
    add_goals
    flash[:success] = "Goal Added!"
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js
    end
  rescue ActiveRecord::RecordInvalid => ex
    flash[:danger] = ex.message
    redirect_to dashboard_path
  end

  def index
  end

  private

  def add_goals
    dives = Dive.find(params[:dives])
    dives.each do |dive|
      goal = Goal.find_or_create_by(dive_id: dive.id)
      @diver.goals << goal
    end
  end

  def set_diver
    @diver = current_coach.divers.find(params[:diver_id])
  end

  def set_divers
    @divers = current_coach.divers.active.includes(goals: :dive).order(:name)
  end
end
