class AttendanceReportsController < ApplicationController
  before_action :set_team,
                :set_line_chart_data,
                :set_attendance_by_day_data,
                :set_diver_averages

  def show
  end

  private

  def start_date
    @start_date = params[:start_date] || @team.practices.order(:date).first.date
  end

  def end_date
    @end_date = params[:end_date] || Date.today
  end

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
      report_divers
        .select("divers.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
        .select("sum(case when diver_practices.excused_absence then 1 else 0 end) as excused_absence_count")
        .select("sum(case when diver_practices.was_present then 1 else 0 end) as practices_made_count")
        .select("sum(case when diver_practices.was_present then 0 else 1 end) as absence_count")
        .group("divers.id").each { |diver| results[diver] = (100 * diver.attendance_percentage).round(0) }
    end.sort_by { |diver, average| average }.reverse
  end

  def report_divers
    divers = @team.divers.joins(:practices).where(practices: { date: start_date..end_date })
    divers = params[:include_makeups].blank? ? divers.where(practices: { is_makeup: false }) : divers
    divers = params[:include_excused].blank? ? divers.where(diver_practices: { excused_absence: nil }) : divers
  end

  def build_attendance_by_day_data
    results = {}
    report_practices.joins(:diver_practices)
      .select("practices.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
      .where("practices.date <= (?)", Date.today)
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
      report_practices.joins(:diver_practices)
        .select("practices.*, (sum(case when diver_practices.was_present then 1 else 0 end) / count(diver_practices.id)::float) as attendance_percentage")
        .where("practices.date <= (?)", Date.today)
        .order(:date).group("practices.id")
        .each { |practice| results[practice.date.strftime('%-m/%-d')] = (100 * practice.attendance_percentage).round(0) }
    end
  end

  def report_practices
    practices = @team.practices.where(date: start_date..end_date).order(:date)
    params[:include_makeups].blank? ? practices.where(is_makeup: false) : practices
  end

  def average_attendance(attendances)
    if attendances.any?
      attendances.inject(0.0) { |sum, el| sum + el } / attendances.size
    else
      0
    end
  end
end
