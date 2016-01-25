class DiverPracticesController < ApplicationController
  before_action :authorize, :set_diver, :set_diver_practice

  # TODO: how to prevent loading all these?
  # can def scope to current month, but still...
  def mark_absent
    @diver_practice.update(was_present: false)
    @practices = @diver.team.practices
    @divers = @diver.team.divers
  end

  def mark_present
    @diver_practice.update(was_present: true)
    @practices = @diver.team.practices
    @divers = @diver.team.divers
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:diver_id])
  end

  def set_diver_practice
    @diver_practice = @diver.diver_practices.find(params[:id])
  end
end
