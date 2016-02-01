class AttendanceReportsController < ApplicationController
  before_action :authorize, :set_team, :set_line_chart_data, :set_attendance_by_day_data, :set_diver_averages

  def show
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_line_chart_data
    @line_chart_data = build_line_data
  end

  def set_attendance_by_day_data
    @attendance_by_day_data = build_attendance_by_day_data
  end

  def set_diver_averages
    @diver_averages = build_diver_averages
  end

  def build_diver_averages
    {}.tap do |results|
      @team.divers.joins(:diver_practices)
        .select("divers.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
        .group("divers.id").each { |diver| results[diver] = (100 * diver.attendance_percentage).round(0) }
    end.sort_by { |diver, average| average }.reverse
  end

  def build_attendance_by_day_data
    results = {}
    @team.practices.joins(:diver_practices)
      .select("practices.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
      .order(:date).group("practices.id")
      .each do |practice|
        results[practice.date.wday] ||= []
        results[practice.date.wday] << (100 * practice.attendance_percentage).round(0)
      end
    attendance_by_day = {}
    # possible to do this at database level?
    results.each { |day, attendances| attendance_by_day[Date::DAYNAMES[day]] = average_attendance(attendances) }
    attendance_by_day
  end

  def build_line_data
    {}.tap do |results|
      @team.practices.joins(:diver_practices)
        .select("practices.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
        .order(:date).group("practices.id")
        .each { |practice| results[practice.date.strftime('%-m/%-d')] = (100 * practice.attendance_percentage).round(0) }
    end
  end

  def average_attendance(attendances)
    if attendances.any?
      attendances.inject(0.0) { |sum, el| sum + el } / attendances.size
    else
      0
    end
  end
end
