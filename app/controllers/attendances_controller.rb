class AttendancesController < ApplicationController
  before_action :authorize, :set_team, :set_divers
  before_action :set_practices, only: :update_date_range

  def show
  end

  def update_date_range
    respond_to { |format| format.js }
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_divers
    @divers = @team.divers.active.includes(:diver_practices).order(:name)
  end

  def set_practices
    @practices = @team.practices.where(date: params[:start_date]..params[:end_date]).order(:date)
  end

end
