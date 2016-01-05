class ListDivesController < ApplicationController
  before_action :authorize
  before_action :set_list

  def new
    @dives = Dive.all
  end

  def create
    if list_dive = @list.list_dives.create(list_dive_params)
      redirect_to diver_list_path(@list.diver, @list)
    else
      redirect_to new_diver_list_list_dive_path(list_id: @list.id)
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_dive_params
    params.require(:list_dive).permit(:dive_id, :notes)
  end
end
