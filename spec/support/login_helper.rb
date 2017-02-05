module LoginHelper
  def login(coach)
    request.session[:coach_id] = coach.id
  end

  def current_coach
    Coach.find(request.session[:coach_id])
  end
end
