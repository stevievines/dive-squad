class PracticesController < ApplicationController
  before_action :set_team
  before_action :set_practice, only: :destroy

  def add_practices
    params[:practice_days].present? ? find_or_create_practices : find_or_create_single_practice
    redirect_to team_attendance_path(@team), flash: { success: 'Practices Added!' }
  end

  def export_practices
    google_drive_request = GoogleDriveRequest.new(coach: @current_coach)
    if google_drive_request.upload_team_attendance(team: @team)
      redirect_to team_attendance_path(@team), flash: { success: 'Practices Exported!' }
    else
      redirect_to team_attendance_path(@team), flash: { danger: 'Export Failed! Try Reconnecting your Google Account on the Settings Page.' }
    end
  end

  def destroy
    @practice.destroy
    redirect_to team_attendance_path(@team), flash: { success: 'Practice Removed' }
  end

  private

  def set_team
    @team = @current_coach.teams.find(params[:team_id])
  end

  def set_practice
    @practice = @team.practices.find(params[:id])
  end

  def find_or_create_practices
    (Date.today.beginning_of_month..Date.today.end_of_month).each do |day|
      if is_practice_day?(day)
        practice = find_or_create_practice(day)
        find_or_create_diver_practices(practice)
      end
    end
  end

  def find_or_create_single_practice
    practice = @team.practices.find_or_create_by(date: params[:date], is_makeup: params[:is_makeup].present?)
    find_or_create_diver_practices(practice)
  end

  def is_practice_day?(day)
    day.wday.to_s.in?(params[:practice_days])
  end

  def find_or_create_practice(day)
    @team.practices.find_or_create_by(date: day)
  end

  def find_or_create_diver_practices(practice)
    @team.divers.active.includes(:diver_practices).each do |diver|
      diver.diver_practices.find_or_create_by(practice: practice) unless diver.join_date > practice.date
    end
  end
end
