class GoogleDrivesController < ApplicationController
  before_action :authorize

  def create
    Rails.logger.info("Creating New Google Drive Connection")
    save_google_drive_data!
    redirect_to root_path
  end

  private

  def save_google_drive_data!
    binding.pry
    if request.env['omniauth.auth'].present?
      @current_coach.update(google_drive_data: request.env['omniauth.auth']["credentials"])
    end
  end
end
