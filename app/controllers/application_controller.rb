class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  def current_coach
    @current_coach ||= Coach.find(session[:coach_id]) if session[:coach_id]
  end

  private

  def authorize
    redirect_to login_path unless current_coach
  end

  def all_teams
    @teams = @current_coach.teams
  end

  def all_divers
    if params[:team_id].present?
      @divers = @current_coach.teams.find(params[:team_id]).divers
    else
      @divers = @current_coach.divers
    end
  end

  def all_dives
    @dives ||= Dive.all
  end

end
