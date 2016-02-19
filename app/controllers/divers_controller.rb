class DiversController < ApplicationController
  before_action :authorize
  before_action :all_teams, only: [:edit, :create, :update, :destroy]
  before_action :all_divers, only: [:index, :create, :update, :destroy]
  before_action :set_diver, only: [:edit, :update, :destroy, :deactivate]

  def new
    @diver = Diver.new
    @teams = @current_coach.teams
  end

  def create
    @diver = Diver.create(diver_params)
    redirect_to :back, flash: { success: "Diver Created!" }
  end

  def show
    @diver = Diver.find(params[:id])
  end

  def update
    @diver.update_attributes(diver_params)
  end

  def destroy
    @diver.destroy
  end

  def deactivate
    @diver.update(
      deactivated_at: params[:deactivated_at],
      deactivation_reason: params[:deactivation_reason]
    )
    remove_diver_practices_after_deactivation!
    redirect_to :back, { flash: { success: 'Diver has been deactivated!' } }
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:id])
  end

  def diver_params
    params.require(:diver).permit(:name, :join_date, :birthday, :email, :phone, :team_id)
  end

  def remove_diver_practices_after_deactivation!
    @diver.diver_practices.joins(:practice).where("practices.date > (?)", @diver.deactivated_at).destroy_all
  end
end
