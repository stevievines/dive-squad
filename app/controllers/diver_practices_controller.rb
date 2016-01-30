class DiverPracticesController < ApplicationController
  before_action :authorize, :set_diver, :set_diver_practice

  def toggle_attendance
    @diver_practice.toggle!(:was_present)
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:diver_id])
  end

  def set_diver_practice
    @diver_practice = @diver.diver_practices.find(params[:id])
  end
end
