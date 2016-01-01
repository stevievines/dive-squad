class ListsController < ApplicationController
  before_action :authorize
  before_action :set_diver

  def create
    if @diver.lists.create(list_params)
      redirect_to diver_path(@diver)
    else
      redirect_to new_diver_list_path(@diver)
    end
  end

  def show
    @list = @diver.lists.find(params[:id])
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:diver_id])
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
