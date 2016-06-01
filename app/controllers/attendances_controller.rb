class AttendancesController < ApplicationController
  before_action :authorize, :set_team, :set_divers

  def show
    @practices = set_practices
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_divers
    @divers = @team.divers.active.includes(:diver_practices)
  end

  def set_practices
    case params[:date_range]
    when 'today'
      @team.practices.where(date: Date.today).order(:date)
    when 'this_week'
      @team.practices.where(date: Date.today.beginning_of_week..Date.today.end_of_week).order(:date)
    when 'this_month'
      @team.practices.where(date: Date.today.beginning_of_month..Date.today.end_of_month).order(:date)
    else
      @team.practices.where(date: Date.today).order(:date)
    end
  end

end
