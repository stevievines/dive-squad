class DiverPracticesController < ApplicationController
  before_action :set_diver, :set_diver_practice

  def toggle_attendance
    @diver_practice.toggle!(:was_present)
  end

  def set_minutes_late
    @diver_practice.update(minutes_late: params[:minutes_late])
    redirect_to :back, flash: { success: 'Diver lateness has been recorded!' }
  end

  def set_excuse
    @diver_practice.update(
      excuse: params[:excuse],
      excused_absence: params[:excused_absence].present?
    )
    redirect_to :back, flash: { success: 'Excuse saved!' }
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:diver_id])
  end

  def set_diver_practice
    @diver_practice = @diver.diver_practices.find(params[:id])
  end
end
