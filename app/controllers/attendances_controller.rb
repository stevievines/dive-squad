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
    @divers = @team.divers.includes(:diver_practices)
  end

  def set_practices
    case params[:date_range]
    when 'day'
      @team.practices.where(date: Date.today).order(:date)
    when 'week'
      @team.practices.where(date: 7.days.ago..Date.today).order(:date)
    when 'month'
      @team.practices.where(date: 30.days.ago..Date.today).order(:date)
    else
      @team.practices.where(date: Date.today).order(:date)
    end
  end

end
