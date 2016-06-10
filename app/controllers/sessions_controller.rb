class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    coach = Coach.find_by_email(params[:email])
    # if the coach exists AND the password entered is correct
    if coach && coach.authenticate(params[:password])
      # save the coach id inside the browser cookie. This is how we keep the coach logged in when they navigate around our website.
      session[:coach_id] = coach.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:coach_id] = nil
    redirect_to login_path
  end

end
