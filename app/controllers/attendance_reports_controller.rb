class AttendanceReportsController < ApplicationController
  before_action :authorize, :set_team, :set_line_chart_data

  def show
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_line_chart_data
    @line_chart_data = build_line_data
  end

  def build_line_data
    # hash of practices with date of practice, and percent attendance
    # how to deal with people joining group mid month? can add start date
    # to diver, but how to get reports to filter that appropriately?

    # will this get pratices that were totally unattended?
    team_divers = @team.divers.count.to_f
    if team_divers > 0
      {}.tap do |results|
        @team.practices.joins(:diver_practices)
          .select("practices.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
          .order(:date).group("practices.id")
          .each { |practice| results[practice.date.strftime('%a %m/%d')] = 100 * practice.attendance_percentage.round(2) }
      end
    else
      {}
    end
  end
end
