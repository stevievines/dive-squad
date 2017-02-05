class DashboardsController < ApplicationController
  before_action :all_teams, :all_divers, :all_dives

  # Overriding Application controller method for more reporting counts
  def all_teams
    @teams = @current_coach.teams.joins("LEFT JOIN practices ON practices.team_id = teams.id LEFT JOIN diver_practices on diver_practices.practice_id = practices.id")
      .where("practices.id IS NULL OR practices.date <= ?", Date.today)
      .select("teams.*, sum(case when diver_practices.was_present then 1 else 0 end) / CASE COUNT(diver_practices.id) WHEN 0 THEN 1.0 ELSE COUNT(diver_practices.id)::float END as attendance_percentage")
      .select("COUNT(DISTINCT practices.id) as practice_count")
      .group("teams.id")
  end
end
