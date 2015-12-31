class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_coach
    @current_coach ||= Coach.find(session[:coach_id]) if session[:coach_id]
  end

  def authorize
    redirect_to login_path unless current_coach
  end

end
