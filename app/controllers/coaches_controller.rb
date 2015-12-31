class CoachesController < ApplicationController
  before_action :authorize, only: :show
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

  def show
    @coach = Coach.find(params[:id])
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :email, :password, :password_confirmation)
  end

end
