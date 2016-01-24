class GoogleDrivesController < ApplicationController
  before_action :authorize

  def create
    Rails.logger.info("HERE WE ARE! params: #{params}")
    puts("HERE WE ARE! params: #{params}")
    redirect_to root_path
    #binding.pry
  end
end
