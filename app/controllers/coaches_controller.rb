class CoachesController < ApplicationController
  before_action :authorize, only: [:show, :update]
  before_action :set_coach, only: [:show, :update]

  def new
    @coach = Coach.new
  end

  def create
    if coach = Coach.create(coach_params)
      session[:coach_id] = coach.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def update
    if @coach.update(coach_update_params)
      flash[:success] = "Details Updated!"
    else
      flash[:danger] = "Details could not be updated"
    end
    redirect_to :back
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :email, :password, :password_confirmation)
  end

  def coach_update_params
    params.require(:coach).permit(:name, :email)
  end

  def set_coach
    @coach = Coach.find(params[:id])
  end

end
