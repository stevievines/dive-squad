class ListsController < ApplicationController
  before_action :authorize
  before_action :set_diver
  before_action :set_dives, only: [:new, :edit]
  before_action :set_list, only: [:edit, :update, :destroy]

  def new
    @list = List.new
  end

  def create
     @diver.lists.create(list_params)
  end

  def show
    @list = @diver.lists.find(params[:id])
  end

  def update
    @list.update_attributes(list_params)
    @lists = @diver.lists
  end

  def destroy
    @list.destroy
  end

  private

  def set_diver
    @diver = @current_coach.divers.find(params[:diver_id])
  end

  def set_dives
    @dives = Dive.all
  end

  def set_list
    @list = @diver.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description, list_dives_attributes: [:dive_id, :notes, :_destroy, :id])
  end
end
