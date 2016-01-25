class AttendancesController < ApplicationController
  before_action :authorize, :set_team, :set_divers

  def show
    @practices = @team.practices.sort_by(&:date) # add filter
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_divers
    @divers = @team.divers.includes(:diver_practices)
  end

end
