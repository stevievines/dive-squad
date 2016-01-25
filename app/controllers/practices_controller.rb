class PracticesController < ApplicationController
  before_action :authorize, :set_team

  def add_practices
    find_or_create_practices
    redirect_to :back, flash: { success: 'Practices Added!' }
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def find_or_create_practices
    (Date.today.beginning_of_month..Date.today.end_of_month).each do |day|
      if is_practice_day?(day)
        practice = find_or_create_practice(day)
        find_or_create_diver_practices(practice)
      end
    end
  end

  def is_practice_day?(day)
    day.wday.to_s.in?(params[:practice_days])
  end

  def find_or_create_practice(day)
    @team.practices.find_or_create_by(date: day)
  end

  def find_or_create_diver_practices(practice)
    @team.divers.includes(:diver_practices).each do |diver|
      diver.diver_practices.find_or_create_by(practice: practice)
    end
  end
end
